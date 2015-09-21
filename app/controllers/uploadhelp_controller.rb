class UploadhelpController < ApplicationController
       # upload help 컨트롤러는 사용자가 업로드 하거나 도움을 받기 위해 정보를 입력하기 위한 컨트롤러 입니다.
    #회원 권한이 있어야 접근하도록 하게 해주세요.
    def daily
        
    end
    
    def daily2
        @dailydata= Daily.new
        @dailydata.user_id = params[:user_id]
        @dailydata.my_image4= params[:image_file4]
        @dailydata.my_image5= params[:image_file5]
        @dailydata.my_image6= params[:image_file6]
        if params[:title].nil?
            @dailydata.title = '[제목없음]'
        else
            @dailydata.title = params[:title]
        end
        if params[:hashtag].nil?
            @dailydata.hashtag = '[태그없음]'
        else   
            @dailydata.hashtag = params[:hashtag]
        end
        if params[:tall].nil?
            @dailydata.tall = 0
        else
            @dailydata.tall = params[:tall]
        end
        if params[:kg].nil?
            @dailydata.kg = 0 
        else
            @dailydata.kg = params[:kg]
        end
        if params[:upsize].nil?
            @dailydata.upsize ='[사이즈없음]'
        else    
            @dailydata.upsize = params[:upsize]
        end
        if params[:downsize].nil?
            @dailydata.downsize = '[사이즈없음]'
        else
            @dailydata.downsize = params[:downsize]
        end
        if params[:head].nil?
            @dailydata.head = '[내용없음]'
        else
            @dailydata.head = params[:head]
        end
        if params[:top].nil?
            @dailydata.top = '[내용없음]'    
        else
            @dailydata.top = params[:top]
        end
        if params[:bottom].nil?
            @dailydata.bottom = '[내용없음]'
        else
            @dailydata.bottom = params[:bottom]
        end
        if params[:shoes].nil?
            @dailydata.shoes = '[내용없음]'
        else
            @dailydata.shoes = params[:shoes]
        end
        if params[:accessory].nil?
            @dailydata.accessory = '[내용없음]'
        else
            @dailydata.accessory = params[:accessory]
        end
        if params[:etc].nil?
            @dailydata.etc = '[내용없음]'
        else
        @dailydata.etc = params[:etc]
        end
        @dailydata.viewcount = 0
        
        @dailydata.save
        redirect_to '/'
    end
    
    def dailyview
        u_p = Array.new
        posts = Daily.all.paginate(:page => params[:page], :per_page => 15)
        posts.each do |post|
            u_p.push({post: post, user: User.find(post.user_id)})
        end
        @posts = posts
        
        @u_ps = u_p
    end
    
    def dailymodify
        @dailycontent = Daily.find(params[:id])
    end
   
    def helpview
        @posts = Help.all.paginate(:page => params[:page], :per_page => 15)
    end 
    
    
    def help
    end
    
    def help2
        @helpdate = Help.new
        hashtag = params[:hashtag].delete ","
        hashtag = hashtag.gsub(/\s+/, "") #'#해시태그1#해시태그2처럼 붙어서 저장
        @helpdate.user_id = params[:user_id]
        @helpdate.hashtag= hashtag
        @helpdate.title = params[:title]
        @helpdate.tall = params[:tall]
        @helpdate.kg = params[:kg] 
        @helpdate.upsize = params[:upsize]
        @helpdate.downsize = params[:downsize]
        @helpdate.explain = params[:explain]
        @helpdate.my_image1= params[:image_file1]
        @helpdate.my_image2= params[:image_file2]
        @helpdate.my_image3= params[:image_file3]
        @helpdate.userid = ""
        @helpdate.likeone = 0
        @helpdate.liketwo = 0
        @helpdate.manleftlike = 0
        @helpdate.manrightlike= 0
        @helpdate.womanleftlike = 0
        @helpdate.womanrightlike = 0
        @helpdate.viewcount = 0
        @helpdate.save
        redirect_to '/'
    end
   
   
   def helpmodify
       @helpcontent = Help.find(params[:id])
   end
   
   def helpmodify2
       helpcontent = Help.find(params[:id])
       helpcontent.title = params[:title]
       helpcontent.hashtag = params[:hashtag]
       helpcontent.tall = params[:tall]
       helpcontent.kg = params[:kg]
       helpcontent.upsize = params[:upsize]
       helpcontent.downsize = params[:downsize]
       helpcontent.explain = params[:explain]
       helpcontent.save
       redirect_to '/home/detail/' + helpcontent.id.to_s
   end
end
