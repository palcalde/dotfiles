Vim�UnDo� ��.|����V�B�Delc^)�l��":�����r   t           M      
      
   
       V��g    _�                    @   M    ����                                                                                                                                                                                                                                                                                                                                       t           V        V��g     �   ?   A   t      P      NSRunLoop.mainRunLoop.runUntilDate(NSDate.dateWithTimeIntervalSinceNow(1))5�_�                    K   M    ����                                                                                                                                                                                                                                                                                                                                       t           V        V��o     �   J   L   t      P      NSRunLoop.mainRunLoop.runUntilDate(NSDate.dateWithTimeIntervalSinceNow(1))5�_�      	              V   M    ����                                                                                                                                                                                                                                                                                                                                       t           V        V��s     �   U   W   t      P      NSRunLoop.mainRunLoop.runUntilDate(NSDate.dateWithTimeIntervalSinceNow(1))5�_�      
           	   n   M    ����                                                                                                                                                                                                                                                                                                                                                             V��x    �   m   o   t      P      NSRunLoop.mainRunLoop.runUntilDate(NSDate.dateWithTimeIntervalSinceNow(1))5�_�   	               
   S       ����                                                                                                                                                                                                                                                                                                                                                             V���     �       u       t   4describe "SessionManager and SessionStoreManager" do     extend WebStub::SpecHelpers         before do       @user = UserFactory.user   G    @authorization = Authorization.new(storage_value: "test:123456789")   F    @session = Session.new(authorization: @authorization, user: @user)   -    SessionStoreManager.add_session(@session)   2    SessionStoreManager.current_session = @session   )    @session_manager = SessionManager.new     end       
  after do       SessionStoreManager.clear     end       !  describe SessionStoreManager do   *    it 'can migrate old authorizations' do   A      App::Persistence['authorizations'] = ['123:456', '654:321']   1      SessionStoreManager.migrate_authorizations!   4      App::Persistence['authorizations'].should == {           '123:456' => {},           '654:321' => {}         }       end       )    it "can return a list of sessions" do   2      session = SessionStoreManager.sessions.first   '      session.should.be.kind_of Session   4      session.authorization.should == @authorization   ,      session.user.name.should == @user.name       end           it "can add a session" do   4      SessionStoreManager.sessions.count.should == 1       end           it "can remove session" do   2      SessionStoreManager.remove_session(@session)   4      SessionStoreManager.sessions.count.should == 0       end       *    it "can return the current session" do   3      session = SessionStoreManager.current_session   '      session.should.be.kind_of Session   4      session.authorization.should == @authorization   ,      session.user.name.should == @user.name       end     end         describe SessionManager do   2    it "can determine if the user is logged in" do   .      SessionManager.logged_in?.should == true         SessionStoreManager.clear   /      SessionManager.logged_in?.should == false       end           it 'can fetch a session' do   0      user_resource = UserResource.new(@session)   G      stub = stub_request(:get, "#{Defaults.host}#{user_resource.url}")         .to_return({})         block = proc {}   6      @session_manager.fetch_session(@session, &block)   P      NSRunLoop.mainRunLoop.runUntilDate(NSDate.dateWithTimeIntervalSinceNow(1))         stub.should.be.requested         block.should.be.called       end       &    it 'can change current session' do   0      user_resource = UserResource.new(@session)   G      stub = stub_request(:get, "#{Defaults.host}#{user_resource.url}")         .to_return({})         block = proc {}   ?      @session_manager.change_current_session(@session, &block)   P      NSRunLoop.mainRunLoop.runUntilDate(NSDate.dateWithTimeIntervalSinceNow(1))         stub.should.be.requested         block.should.be.called       end            it 'can request a logout' do   B      authorization_resource = AuthorizationResource.new(@session)   S      stub = stub_request(:delete, "#{Defaults.host}#{authorization_resource.url}")         .to_return({})         block = proc {}   7      @session_manager.request_logout(@session, &block)   P      NSRunLoop.mainRunLoop.runUntilDate(NSDate.dateWithTimeIntervalSinceNow(1))         stub.should.be.requested         block.should.be.called   /      SessionManager.sessions.count.should == 0   2      SessionManager.current_session.should == nil       end       $    it 'can handle an auth error' do         block = proc {}   :      @session_manager.handle_auth_error(@session, &block)         block.should.be.called   /      SessionManager.sessions.count.should == 0   2      SessionManager.current_session.should == nil       end       3    it 'adds a new session after authentication' do   E      authorization_resource = AuthorizationResource.new(Session.new)   Q      stub = stub_request(:post, "#{Defaults.host}#{authorization_resource.url}")         .to_return(json: {           access_token: "foo",           token_type: "Bearer"         })         block = proc {}   E      @session_manager.authenticate('bla@example.com', '123', &block)   P      NSRunLoop.mainRunLoop.runUntilDate(NSDate.dateWithTimeIntervalSinceNow(1))         stub.should.be.requested         block.should.be.called   /      SessionManager.sessions.count.should == 2       end     end   end5�_�                    6       ����                                                                                                                                                                                                                                                                                                                                       t           V        V��     �   5   7   t            SessionStoreManager.clea5�_�                    @   P    ����                                                                                                                                                                                                                                                                                                                                       t           V        V���     �   ?   A   t      O      NSRunLoop.mainRunLoop.runUntilDate(NSDate.dateWithTimeIntervalSinceNow())5�_�                            ����                                                                                                                                                                                                                                                                                                                                       t           V        V��r    �                 6# describe "SessionManager and SessionStoreManager" do�                #   extend WebStub::SpecHelpers�                 �                #   before do�                #     @user = UserFactory.user�                I#     @authorization = Authorization.new(storage_value: "test:123456789")�                H#     @session = Session.new(authorization: @authorization, user: @user)�      	          /#     SessionStoreManager.add_session(@session)�      
          4#     SessionStoreManager.current_session = @session�   	             +#     @session_manager = SessionManager.new�   
             #   end�                 �                #   after do�                #     SessionStoreManager.clear�                #   end�                 �                ##   describe SessionStoreManager do�                ,#     it 'can migrate old authorizations' do�                C#       App::Persistence['authorizations'] = ['123:456', '654:321']�                3#       SessionStoreManager.migrate_authorizations!�                6#       App::Persistence['authorizations'].should == {�                #         '123:456' => {},�                #         '654:321' => {}�                	#       }�                	#     end�                 �                +#     it "can return a list of sessions" do�                4#       session = SessionStoreManager.sessions.first�                )#       session.should.be.kind_of Session�                6#       session.authorization.should == @authorization�                 .#       session.user.name.should == @user.name�      !          	#     end�       "           �   !   #          #     it "can add a session" do�   "   $          6#       SessionStoreManager.sessions.count.should == 1�   #   %          	#     end�   $   &           �   %   '           #     it "can remove session" do�   &   (          4#       SessionStoreManager.remove_session(@session)�   '   )          6#       SessionStoreManager.sessions.count.should == 0�   (   *          	#     end�   )   +           �   *   ,          ,#     it "can return the current session" do�   +   -          5#       session = SessionStoreManager.current_session�   ,   .          )#       session.should.be.kind_of Session�   -   /          6#       session.authorization.should == @authorization�   .   0          .#       session.user.name.should == @user.name�   /   1          	#     end�   0   2          #   end�   1   3           �   2   4          #   describe SessionManager do�   3   5          4#     it "can determine if the user is logged in" do�   4   6          0#       SessionManager.logged_in?.should == true�   5   7          !#       SessionStoreManager.clear�   6   8          1#       SessionManager.logged_in?.should == false�   7   9          	#     end�   8   :           �   9   ;          !#     it 'can fetch a session' do�   :   <          2#       user_resource = UserResource.new(@session)�   ;   =          I#       stub = stub_request(:get, "#{Defaults.host}#{user_resource.url}")�   <   >          #       .to_return({})�   =   ?          #       block = proc {}�   >   @          8#       @session_manager.fetch_session(@session, &block)�   ?   A          T#       NSRunLoop.mainRunLoop.runUntilDate(NSDate.dateWithTimeIntervalSinceNow(0.5))�   @   B           #       stub.should.be.requested�   A   C          #       block.should.be.called�   B   D          	#     end�   C   E           �   D   F          (#     it 'can change current session' do�   E   G          2#       user_resource = UserResource.new(@session)�   F   H          I#       stub = stub_request(:get, "#{Defaults.host}#{user_resource.url}")�   G   I          #       .to_return({})�   H   J          #       block = proc {}�   I   K          A#       @session_manager.change_current_session(@session, &block)�   J   L          T#       NSRunLoop.mainRunLoop.runUntilDate(NSDate.dateWithTimeIntervalSinceNow(0.5))�   K   M           #       stub.should.be.requested�   L   N          #       block.should.be.called�   M   O          	#     end�   N   P           �   O   Q          "#     it 'can request a logout' do�   P   R          D#       authorization_resource = AuthorizationResource.new(@session)�   Q   S          U#       stub = stub_request(:delete, "#{Defaults.host}#{authorization_resource.url}")�   R   T          #       .to_return({})�   S   U          #       block = proc {}�   T   V          9#       @session_manager.request_logout(@session, &block)�   U   W          T#       NSRunLoop.mainRunLoop.runUntilDate(NSDate.dateWithTimeIntervalSinceNow(0.5))�   V   X           #       stub.should.be.requested�   W   Y          #       block.should.be.called�   X   Z          1#       SessionManager.sessions.count.should == 0�   Y   [          4#       SessionManager.current_session.should == nil�   Z   \          	#     end�   [   ]           �   \   ^          &#     it 'can handle an auth error' do�   ]   _          #       block = proc {}�   ^   `          <#       @session_manager.handle_auth_error(@session, &block)�   _   a          #       block.should.be.called�   `   b          1#       SessionManager.sessions.count.should == 0�   a   c          4#       SessionManager.current_session.should == nil�   b   d          	#     end�   c   e           �   d   f          5#     it 'adds a new session after authentication' do�   e   g          G#       authorization_resource = AuthorizationResource.new(Session.new)�   f   h          S#       stub = stub_request(:post, "#{Defaults.host}#{authorization_resource.url}")�   g   i          #       .to_return(json: {�   h   j          #         access_token: "foo",�   i   k          #         token_type: "Bearer"�   j   l          
#       })�   k   m          #       block = proc {}�   l   n          G#       @session_manager.authenticate('bla@example.com', '123', &block)�   m   o          T#       NSRunLoop.mainRunLoop.runUntilDate(NSDate.dateWithTimeIntervalSinceNow(0.5))�   n   p           #       stub.should.be.requested�   o   q          #       block.should.be.called�   p   r          1#       SessionManager.sessions.count.should == 2�   q   s          	#     end�   r   t          #   end�   s   u          # end5�_�                            ����                                                                                                                                                                                                                                                                                                                                       t           V        V��     �                 4describe "SessionManager and SessionStoreManager" do5�_�                            ����                                                                                                                                                                                                                                                                                                                                       t           V        V��s     �          t      u5��