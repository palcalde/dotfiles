Vim�UnDo� ;���7-H�WyY�'��q�/iL����~�
W�       ## describe AuthorizationResource do                             V��9   	 _�                             ����                                                                                                                                                                                                                                                                                                                                                   V        V��9    �                 ## describe AuthorizationResource do�                #   extend WebStub::SpecHelpers�                 �                #   before do�                F#     @authorization_resource = AuthorizationResource.new(Session.new)�                #   end�                 �      	          '#   it "requests user authorization" do�      
          R#     stub = stub_request(:post, "#{Defaults.host}#{@authorization_resource.url}")�   	             #     .to_return(json: {�   
             #       access_token: "foo",�                #       token_type: "Bearer"�                #     })�                #     block = proc {}�                O#     @authorization_resource.authorize!("foo@example.com", "password", &block)�                R#     NSRunLoop.mainRunLoop.runUntilDate(NSDate.dateWithTimeIntervalSinceNow(0.5))�                #     stub.should.be.requested�                #     block.should.be.called�                A#     @authorization_resource.model.is_authorized?.should == true�                #   end�                 �                #   it "can request logout" do�                H#     stub = stub_request(:delete, "#{Defaults.host}/api/authorization")�                #     .to_return({})�                #     block = proc {}�                -#     @authorization_resource.destroy(&block)�                R#     NSRunLoop.mainRunLoop.runUntilDate(NSDate.dateWithTimeIntervalSinceNow(0.5))�                #     stub.should.be.requested�                #     block.should.be.called�                #   end�                  �      !          # end5�_�           
                 ����                                                                                                                                                                                                                                                                                                                                                  V        V��3    �                 ## describe AuthorizationResource do5�_�          	      
           ����                                                                                                                                                                                                                                                                                                                                                  V        V��(     �                 ## describe AuthorizationResource do5�_�   
                          ����                                                                                                                                                                                                                                                                                                                                                  V        V��,     �                  5�_�              
   	           ����                                                                                                                                                                                                                                                                                                                                                   V        V��"    �                 ## describe AuthorizationResource do�                #   extend WebStub::SpecHelpers�                 �                #   before do�                F#     @authorization_resource = AuthorizationResource.new(Session.new)�                #   end�                 �      	          '#   it "requests user authorization" do�      
          R#     stub = stub_request(:post, "#{Defaults.host}#{@authorization_resource.url}")�   	             #     .to_return(json: {�   
             #       access_token: "foo",�                #       token_type: "Bearer"�                #     })�                #     block = proc {}�                O#     @authorization_resource.authorize!("foo@example.com", "password", &block)�                R#     NSRunLoop.mainRunLoop.runUntilDate(NSDate.dateWithTimeIntervalSinceNow(0.5))�                #     stub.should.be.requested�                #     block.should.be.called�                A#     @authorization_resource.model.is_authorized?.should == true�                #   end�                 �                #   it "can request logout" do�                H#     stub = stub_request(:delete, "#{Defaults.host}/api/authorization")�                #     .to_return({})�                #     block = proc {}�                -#     @authorization_resource.destroy(&block)�                R#     NSRunLoop.mainRunLoop.runUntilDate(NSDate.dateWithTimeIntervalSinceNow(0.5))�                #     stub.should.be.requested�                #     block.should.be.called�                #   end�                  �      !          # end5�_�             	              ����                                                                                                                                                                                                                                                                                                                                                   V        V���     �                 ## describe AuthorizationResource do�                #   extend WebStub::SpecHelpers�                 �                #   before do�                F#     @authorization_resource = AuthorizationResource.new(Session.new)�                #   end�                 �      	          '#   it "requests user authorization" do�      
          R#     stub = stub_request(:post, "#{Defaults.host}#{@authorization_resource.url}")�   	             #     .to_return(json: {�   
             #       access_token: "foo",�                #       token_type: "Bearer"�                #     })�                #     block = proc {}�                O#     @authorization_resource.authorize!("foo@example.com", "password", &block)�                R#     NSRunLoop.mainRunLoop.runUntilDate(NSDate.dateWithTimeIntervalSinceNow(0.5))�                #     stub.should.be.requested�                #     block.should.be.called�                A#     @authorization_resource.model.is_authorized?.should == true�                #   end�                 �                #   it "can request logout" do�                H#     stub = stub_request(:delete, "#{Defaults.host}/api/authorization")�                #     .to_return({})�                #     block = proc {}�                -#     @authorization_resource.destroy(&block)�                R#     NSRunLoop.mainRunLoop.runUntilDate(NSDate.dateWithTimeIntervalSinceNow(0.5))�                #     stub.should.be.requested�                #     block.should.be.called�                #   end�                  �      !          # end5�_�                             ����                                                                                                                                                                                                                                                                                                                                                   V        V���     �                  5�_�                           ����                                                                                                                                                                                                                                                                                                                                                   V        V���     �                 ## describe AuthorizationResource do�                #   extend WebStub::SpecHelpers�                 �                #   before do�                F#     @authorization_resource = AuthorizationResource.new(Session.new)�                #   end�                 �      	          '#   it "requests user authorization" do�      
          R#     stub = stub_request(:post, "#{Defaults.host}#{@authorization_resource.url}")�   	             #     .to_return(json: {�   
             #       access_token: "foo",�                #       token_type: "Bearer"�                #     })�                #     block = proc {}�                O#     @authorization_resource.authorize!("foo@example.com", "password", &block)�                R#     NSRunLoop.mainRunLoop.runUntilDate(NSDate.dateWithTimeIntervalSinceNow(0.5))�                #     stub.should.be.requested�                #     block.should.be.called�                A#     @authorization_resource.model.is_authorized?.should == true�                #   end�                 �                #   it "can request logout" do�                H#     stub = stub_request(:delete, "#{Defaults.host}/api/authorization")�                #     .to_return({})�                #     block = proc {}�                -#     @authorization_resource.destroy(&block)�                R#     NSRunLoop.mainRunLoop.runUntilDate(NSDate.dateWithTimeIntervalSinceNow(0.5))�                #     stub.should.be.requested�                #     block.should.be.called�                #   end�                  �      !          # end5�_�                             ����                                                                                                                                                                                                                                                                                                                                                   V        V���     �                 u5�_�                            ����                                                                                                                                                                                                                                                                                                                                                   V        V���     �                 ## describe AuthorizationResource do�                #   extend WebStub::SpecHelpers�                 �                #   before do�                F#     @authorization_resource = AuthorizationResource.new(Session.new)�                #   end�                 �      	          '#   it "requests user authorization" do�      
          R#     stub = stub_request(:post, "#{Defaults.host}#{@authorization_resource.url}")�   	             #     .to_return(json: {�   
             #       access_token: "foo",�                #       token_type: "Bearer"�                #     })�                #     block = proc {}�                O#     @authorization_resource.authorize!("foo@example.com", "password", &block)�                R#     NSRunLoop.mainRunLoop.runUntilDate(NSDate.dateWithTimeIntervalSinceNow(0.5))�                #     stub.should.be.requested�                #     block.should.be.called�                A#     @authorization_resource.model.is_authorized?.should == true�                #   end�                 �                #   it "can request logout" do�                H#     stub = stub_request(:delete, "#{Defaults.host}/api/authorization")�                #     .to_return({})�                #     block = proc {}�                -#     @authorization_resource.destroy(&block)�                R#     NSRunLoop.mainRunLoop.runUntilDate(NSDate.dateWithTimeIntervalSinceNow(0.5))�                #     stub.should.be.requested�                #     block.should.be.called�                #   end�                  �      !          # end5�_�                            ����                                                                                                                                                                                                                                                                                                                                                   V        V���    �                 ## describe AuthorizationResource do�                #   extend WebStub::SpecHelpers�                 �                #   before do�                F#     @authorization_resource = AuthorizationResource.new(Session.new)�                #   end�                 �      	          '#   it "requests user authorization" do�      
          R#     stub = stub_request(:post, "#{Defaults.host}#{@authorization_resource.url}")�   	             #     .to_return(json: {�   
             #       access_token: "foo",�                #       token_type: "Bearer"�                #     })�                #     block = proc {}�                O#     @authorization_resource.authorize!("foo@example.com", "password", &block)�                R#     NSRunLoop.mainRunLoop.runUntilDate(NSDate.dateWithTimeIntervalSinceNow(0.5))�                #     stub.should.be.requested�                #     block.should.be.called�                A#     @authorization_resource.model.is_authorized?.should == true�                #   end�                 �                #   it "can request logout" do�                H#     stub = stub_request(:delete, "#{Defaults.host}/api/authorization")�                #     .to_return({})�                #     block = proc {}�                -#     @authorization_resource.destroy(&block)�                R#     NSRunLoop.mainRunLoop.runUntilDate(NSDate.dateWithTimeIntervalSinceNow(0.5))�                #     stub.should.be.requested�                #     block.should.be.called�                #   end�                  �      !          # end5�_�                            ����                                                                                                                                                                                                                                                                                                                                                   V        V���     �                 ## describe AuthorizationResource do�                #   extend WebStub::SpecHelpers�                 �                #   before do�                F#     @authorization_resource = AuthorizationResource.new(Session.new)�                #   end�                 �      	          '#   it "requests user authorization" do�      
          R#     stub = stub_request(:post, "#{Defaults.host}#{@authorization_resource.url}")�   	             #     .to_return(json: {�   
             #       access_token: "foo",�                #       token_type: "Bearer"�                #     })�                #     block = proc {}�                O#     @authorization_resource.authorize!("foo@example.com", "password", &block)�                R#     NSRunLoop.mainRunLoop.runUntilDate(NSDate.dateWithTimeIntervalSinceNow(0.5))�                #     stub.should.be.requested�                #     block.should.be.called�                A#     @authorization_resource.model.is_authorized?.should == true�                #   end�                 �                #   it "can request logout" do�                H#     stub = stub_request(:delete, "#{Defaults.host}/api/authorization")�                #     .to_return({})�                #     block = proc {}�                -#     @authorization_resource.destroy(&block)�                R#     NSRunLoop.mainRunLoop.runUntilDate(NSDate.dateWithTimeIntervalSinceNow(0.5))�                #     stub.should.be.requested�                #     block.should.be.called�                #   end�                  �      !          # end5�_�                             ����                                                                                                                                                                                                                                                                                                                                                   V        V���     �                  5��