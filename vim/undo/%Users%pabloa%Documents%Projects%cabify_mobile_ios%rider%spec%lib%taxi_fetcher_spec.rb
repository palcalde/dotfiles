Vim�UnDo� �<o����#�ע�+�Jhl�%�1ۮm�;��                  V   a          a   a    V�j   6 _�       [           V           ����                                                                                                                                                                                                                                                                                                                                                V       V��3   2 �                  end�                2    @taxis.send(:__events__).empty?.should.be.true�                =    @taxi_fetcher.send(:dealloc) #simulate ARC freeing object�                     @taxis = @taxi_fetcher.taxis�                @    @taxi_fetcher.taxis.send(:__events__).empty?.should.be.false�                /  it "unregisters from eventable on dealloc" do5�_�   V   \   X       [           ����                                                                                                                                                                                                                                                                                                                                                V       V�     �                  describe TaxiFetcher do     extend WebStub::SpecHelpers         before do   0    @taxi_fetcher = TaxiFetcher.new(Session.new)   %    @taxi_fetcher.loc = [40.44,-3.44]     end         it "can retrieve taxis" do   S    stub = stub_request(:get, "#{Defaults.host}#{@taxi_fetcher.taxi_resource.url}")       .to_return({ json: [   ?      { _id: "1", loc: [40.44,-3.44], name: "El Tronco Car", },   8      { _id: "2", loc: [40.44,-3.44], name: "Compact", }       ]})        @taxi_fetcher.start_fetching   P    NSRunLoop.mainRunLoop.runUntilDate(NSDate.dateWithTimeIntervalSinceNow(0.5))       stub.should.be.requested   /    @taxi_fetcher.annotations.count.should == 2   )    @taxi_fetcher.taxis.count.should == 2     end       1  # it "unregisters from eventable on dealloc" do   B  #   @taxi_fetcher.taxis.send(:__events__).empty?.should.be.false   "  #   @taxis = @taxi_fetcher.taxis   ?  #   @taxi_fetcher.send(:dealloc) #simulate ARC freeing object   4  #   @taxis.send(:__events__).empty?.should.be.true     # end       end5�_�   [   ]           \           ����                                                                                                                                                                                                                                                                                                                                                V       V��     �                1  # it "unregisters from eventable on dealloc" do   B  #   @taxi_fetcher.taxis.send(:__events__).empty?.should.be.false   "  #   @taxis = @taxi_fetcher.taxis   ?  #   @taxi_fetcher.send(:dealloc) #simulate ARC freeing object   4  #   @taxis.send(:__events__).empty?.should.be.true     # end5�_�   \   ^           ]           ����                                                                                                                                                                                                                                                                                                                                                V       V��   3 �                 5�_�   ]   _           ^           ����                                                                                                                                                                                                                                                                                                                                                V       V��   4 �                 5�_�   ^   `           _           ����                                                                                                                                                                                                                                                                                                                                                V       V�X     �                  describe TaxiFetcher do     extend WebStub::SpecHelpers         before do   0    @taxi_fetcher = TaxiFetcher.new(Session.new)   %    @taxi_fetcher.loc = [40.44,-3.44]     end         it "can retrieve taxis" do   S    stub = stub_request(:get, "#{Defaults.host}#{@taxi_fetcher.taxi_resource.url}")       .to_return({ json: [   ?      { _id: "1", loc: [40.44,-3.44], name: "El Tronco Car", },   8      { _id: "2", loc: [40.44,-3.44], name: "Compact", }       ]})        @taxi_fetcher.start_fetching   P    NSRunLoop.mainRunLoop.runUntilDate(NSDate.dateWithTimeIntervalSinceNow(0.5))       stub.should.be.requested   /    @taxi_fetcher.annotations.count.should == 2   )    @taxi_fetcher.taxis.count.should == 2     end   end5�_�   _   a           `           ����                                                                                                                                                                                                                                                                                                                                                  V        V�^   5 �                /  it "unregisters from eventable on dealloc" do   @    @taxi_fetcher.taxis.send(:__events__).empty?.should.be.false        @taxis = @taxi_fetcher.taxis   =    @taxi_fetcher.send(:dealloc) #simulate ARC freeing object   2    @taxis.send(:__events__).empty?.should.be.true     end    5�_�   `               a           ����                                                                                                                                                                                                                                                                                                                                                  V        V�i   6 �                 5�_�   V   Y   W   [   X           ����                                                                                                                                                                                                                                                                                                                                                V       V�p     �              5�_�   X   Z           Y           ����                                                                                                                                                                                                                                                                                                                                                V       V�q     �              5�_�   Y               Z           ����                                                                                                                                                                                                                                                                                                                                                V       V�r     �              5�_�   V           X   W           ����                                                                                                                                                                                                                                                                                                                                                V       V��3     �                5��