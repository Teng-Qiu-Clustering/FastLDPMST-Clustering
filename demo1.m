%%
close all; 
addpath(genpath(pwd));
%% Datasets
data_names={'A3','S1','UB','2G','Spiral','Jain','3Circles','AGG','Flame','gauss_spiral_circle_dataWithLabel','gauss_spiral_circle_data_in_noiseWithLabel','data_TB_10000','data_SF_10000','data_CC_10000', 'data_CG_10000', 'data_Flower_10000','data_TB_1000000','data_SF_1000000','data_CC_1000000','data_CG_1000000','data_Flower_1000000','PenDigits','MNIST','cytof_h2'};
 
%% Methods
method_names = {'FastLDPMST'};   
%% Start Testing
record_num = 0;
for name_id=1:length(data_names)
    %% load dataset
    clear data annotation_data
    dataName = data_names{name_id};
    disp([num2str(name_id),', ',dataName,':'])
    [data,annotation_data,ClustN,dataName] = load_data(dataName);
    [N,dim]=size(data);
    
    %% parameter setting
    ratio = 0.01; %  [0.01,0.02] is recommended; not needed for manual cutting; 
    mS=ratio*N; % Note: parameter mS (i.e.,the minimal cluster size) is dependent on ratio;
    K = ceil(log2(N)); 
     %% compare different methods
    for method_id = 1:length(method_names)
        method = method_names{method_id};
        switch method
            case 'FastLDPMST'  
                [Label,time] = FastLDPMST(data, ClustN, mS, K); %%
            otherwise
                error('method is not included...please name the method appropriately.')
        end
        %% evaluate result and plot
        diff_colors = linspecer(length(unique(Label))); 
        if dim == 2
            figure; idx = 1:N;
            if N>100000,idx = randperm(N,10000);end
            subplot(1,2,1);scatter(data(idx,1),data(idx,2),10,'k','filled'); axis tight; set(gca,'xtick',[],'ytick',[],'FontSize',10,'Linewidth',.01);box on;
            subplot(1,2,2);scatter(data(idx,1),data(idx,2),3,diff_colors(Label(idx),:),'filled'); axis tight; set(gca,'xtick',[],'ytick',[],'FontSize',10,'Linewidth',.01);box on;
			disp('save plot result as a .png file')
			saveas(gcf,['demo1_result_',dataName,'.png'])
        end
        
        record_num = record_num + 1;
        Result_all(record_num).dataName = dataName;
        Result_all(record_num).N = N;
        Result_all(record_num).DIM = dim;
        if exist('annotation_data','var')
            disp('evaluate the clustering result...')
            if any(isnan(annotation_data))
                id_Nan = isnan(annotation_data);
                annotation_data = annotation_data(~id_Nan);
                Label = Label(~id_Nan);
            end
            [NMI,ARI]= NMI_ARI(Label,annotation_data);
            Result_all(record_num).NMI = round(NMI*1000)/1000; 
            Result_all(record_num).ARI = round(ARI*1000)/1000;  
        end
        Result_all(record_num).time = [sprintf('%.3f',time),'sec']; 
        Result_all(record_num).method = method;
        disp([Result_all(record_num).dataName, ',  Runtime = ',sprintf('%.3f',time),'sec'])
		disp(" "); disp(" ");
    end
end
%% show all results
disp(' ******************** All Results ************************ ')
if exist('Result_all','var')
    disp(struct2table(Result_all, 'AsArray', true)) %struct2table function may not exist in low matlab version; if so, then use the following commented codes
    %     disp('NMI   Time(s)')
    %     for i = 1:length(Result_all)
    %         disp([Result_all(i).data_name, ':', sprintf('%8.2f',Result_all(i).NMI),[sprintf('%8.2f',Result_all(i).time)],'sec'])
    %     end
end

