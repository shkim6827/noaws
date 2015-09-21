class HomeController < ApplicationController
    
    def index
        @mention = Reply.all
        @helpcontents =Help.all
        @posts = Help.paginate(:page => params[:page], :per_page => 8)
        @dailylooks = Daily.paginate(:page => params[:page], :per_page => 8)
        @usercloud = User.all
        
    end
    
    def detail
        id = params[:id].to_i
        @contents = Help.find(id)
        @contents.viewcount += 1
        @contents.save
        user = @contents.user_id
        @user = User.find(user)
        @replies = Reply.paginate(:page => params[:page], :per_page => 15)
        @contents = Help.find(id)
        if (@contents.manleftlike + @contents.manrightlike) == 0
            @manrightpercent = 0
            @manleftpercent = 0 
        else
            @manleftpercent = (@contents.manleftlike.to_f / (@contents.manleftlike + @contents.manrightlike).to_f) * 100
            @manrightpercent = (@contents.manrightlike.to_f / (@contents.manleftlike + @contents.manrightlike).to_f) * 100
        end
        
        if (@contents.womanleftlike + @contents.womanrightlike) == 0
            @womanrightpercent = 0
            @womanleftpercent = 0 
        else
            @womanleftpercent = (@contents.womanleftlike.to_f / (@contents.womanleftlike + @contents.womanrightlike).to_f) * 100
            @womanrightpercent = (@contents.womanrightlike.to_f / (@contents.womanleftlike + @contents.womanrightlike).to_f) * 100
        end
    end
    
    def dailydetail
        id = params[:id].to_i
        @contents = Daily.find(id)
        @contents.viewcount += 1 
        @contents.save
        nextid = id + 1
        beforeid = id - 1
        # 이전 이후 게시물 
        user = @contents.user_id
        @user = User.find(user)
        @replies = Dailyreply.all.paginate(:page => params[:page], :per_page => 15)
    end 
    
    def mypage
        myid = params[:id]
        @helpcontents = Help.where(:user_id => myid)
        @dailycontents = Daily.where(:user_id => myid)
    end
    
    
    def helpall
        @helpdata = Help.all
        
    end
    
    def search
         @helpcontents = Help.search(params[:search])
        # searchkey = params[:search]
        # @idlist = []
        # helpdata = Help.all
        # t = 0
        # if searchkey.include? '#'
        # searchkey = searchkey
        # else 
        #     searchkey ='#'+searchkey
        # end 
    
        # helpdata.each do |h| #딱 하나의 헬프데이터를 불러옴 
        #     keylist = searchkey.split(//)
        #     keylistlen = keylist.length
        #     Array(1..keylistlen-1).each do |k|  #첫글자,,두번째글자,,반복해봐
        #         if h.hashtag.include? keylist[k] #해시태그를 불러와 그리고 인풋값을 리스트로 만들었다? 근데 그 요소가 있니? 그럼 t값을 하나 올려
        #             t = t + 1
        #         else 
        #         end 
        #     end #끝났지? 그럼 티 값이 얼마야 ? #t 값이 2이상이면 결과로 출력해주자 인간적으로 
            
        #     if t > 
        #         #h.hashtag.include? searchkey
        #         @resultid = h.id
        #         @idlist = @idlist.unshift(h.id) #일치하는 글들의 리스트를 불러온다. 최신 순서로 
        #     else
        #     end
        # end#헬프데이터 끝 이제 이것을 반복한다.
        
        
        
    end
    
    def hashall
        @helpdata = Help.all
        
        
    end
    
    def usertest
    end
    
    def reply 
        my_reply = Reply.new # (<- 새 리플 생성 위한 변수 생성)
        my_reply.help_id = params[:help_id]
        my_reply.user_id = params[:user_id] # (<- 새 리플 id는 해당 post의 id로 설정)
        my_reply.nickname = params[:nickname]
        my_reply.age = params[:age]
        my_reply.job = params[:job]
        my_reply.comment = params[:myreply] #(<- 작성된 리플내용을 전달받아 저장)
        my_reply.save # (<- 새로 추가되어 내용이 변경된 리플 저장)
        redirect_to :back
        #redirect_to '/home/detail/' +params[:help_id].to_s
    end
    def dailyreply 
        my_reply = Dailyreply.new # (<- 새 리플 생성 위한 변수 생성)
        my_reply.daily_id = params[:daily_id]
        my_reply.user_id = params[:user_id] # (<- 새 리플 id는 해당 post의 id로 설정)
        my_reply.nickname = params[:nickname]
        my_reply.job = params[:job]
        my_reply.age = params[:age]
        my_reply.comment = params[:myreply] #(<- 작성된 리플내용을 전달받아 저장)
        my_reply.save # (<- 새로 추가되어 내용이 변경된 리플 저장)
        redirect_to :back
        #redirect_to '/home/detail/' +params[:help_id].to_s
    end
    
    def login
        params[:email]
        params[:password]
            
    end
    
    def count
        like = params[:like].to_i
        i_d = params[:i_d]
        contents = Help.find(i_d)
        rehomecode = params[:i_d].to_i
        newuserid = params[:userid].to_s
        
        if not params[:manleftlike].nil?
            contents.manleftlike = contents.manleftlike + 1
        elsif not params[:womanleftlike].nil?
            contents.womanleftlike = contents.womanleftlike + 1
            
        elsif not params[:manrightlike].nil?
            contents.manrightlike = contents.manrightlike + 1
            
        elsif not params[:womanrightlike].nil?
            contents.womanrightlike = contents.womanrightlike + 1
            
        end
        contents.save
        
        
        if like == 1
            if contents.userid.include? ','+ newuserid
            redirect_to '/home/detail/'+ rehomecode.to_s
            
            else #아이디값이 없는 경우 (처응인 경우)
            contents.userid = contents.userid + "," + newuserid.to_s
            exlike = contents.likeone
            contents.likeone = exlike + 1
            contents.save
            redirect_to '/home/detail/'+ rehomecode.to_s
            
            end 
        else # like 가 2값이 왔을 경우 
            if contents.userid.include? ','+ newuserid
            redirect_to '/home/detail/'+ rehomecode.to_s
            
            else #아이디가 없는 경우 (처음인 경우)
            contents.userid = contents.userid + "," + newuserid.to_s
            exlike = contents.liketwo
            contents.liketwo = exlike + 1
            contents.save
            redirect_to '/home/detail/'+ rehomecode.to_s
            end
        end 
        
        
    end
    
    def modify
        @reply = Reply.find(params[:id])
    end
    
    def modify2
        reply = Reply.find(params[:id])
        backhome = reply.help_id 
        newreply = params[:reply] 
        reply.comment = newreply
        reply.save
        redirect_to '/home/detail/' + backhome.to_s
    end

    def destroy
        reply = Reply.find(params[:id])
        if current_user.nil?
            redirect_to :back
        else
            if current_user.id == reply.user_id
                reply.destroy
            else 
                redirect_to :back
            end
             redirect_to :back
        end
    end
    
    def dailydestroy
        reply = Dailyreply.find(params[:id])
        if current_user.nil?
            redirect_to :back
        else
            if current_user.id == reply.user_id
                reply.destroy
            else 
                redirect_to :back
            end
             redirect_to :back
        end
    end
    
    
    def helpcontentdestroy
        helpcontents = Help.find(params[:id])
        if current_user.nil?
            redirect_to :back
        else
            if current_user.id == helpcontents.user_id
                helpcontents.destroy
                redirect_to '/uploadhelp/helpview'
            else 
            end
        end
    end
    def dailycontentdestroy
        dailycontents = Daily.find(params[:id])
        if current_user.nil?
            redirect_to :back
        else
            if current_user.id == dailycontents.user_id
                dailycontents.destroy
                redirect_to '/uploadhelp/dailyview'
            else 
            end
        end
    end    
    
end
