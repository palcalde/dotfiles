Vim�UnDo� �#�J�LXd�K��heh�#���j��;dh�   O                                   W�f   
 _�                     "       ����                                                                                                                                                                                                                                                                                                                                                             W!�    �   !   "              complete5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             W"A     �               P   &class MessageScreen < UIViewController     include EM::Eventable       #  attr_accessor :placeholder, :text         def viewDidLoad   8    self.navigationItem.rightBarButtonItem = done_button   0    self.navigationItem.setHidesBackButton(true)   1    self.title = "journey_message.title".t.upcase   5    self.automaticallyAdjustsScrollViewInsets = false   C    @layout = MessageLayout.new(root: WeakRef.new(self.view)).build       text_view.delegate = self       update_placeholder     end         def done_button       button = ButtonView.new   B    button.setTitle("modal.done".t, forState:UIControlStateNormal)   9    button.when(UIControlEventTouchUpInside) { complete }       button.sizeToFit   4    UIBarButtonItem.alloc.initWithCustomView(button)     end         def text_view       @layout.get(:text_view)     end         def viewWillAppear(animated)   "    text_view.becomeFirstResponder     end       !  def viewWillDisappear(animated)   "    text_view.resignFirstResponder     end         def text=(text)       @text = text       update_placeholder     end         def placeholder=(placeholder)       @placeholder = placeholder       update_placeholder     end         def update_placeholder       return if @layout == nil       if @text.present?   )      @layout.get(:text_view).text = text       else   0      @layout.get(:text_view).text = placeholder       end     end         def complete   $    if text_view.text == placeholder         trigger :message, ''       else   &      trigger :message, text_view.text       end     end       '  def textViewDidBeginEditing(textView)   6    textView.text = '' if textView.text == placeholder     end       %  def textViewDidEndEditing(textView)   7    textView.text = placeholder if textView.text.blank?     end       M  def textView(textView, shouldChangeTextInRange:range, replacementText:text)   !    if text.isEqualToString("\n")   #      textView.resignFirstResponder         complete         return false       end       true     end       end5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             W"G   
 �                0    self.navigationItem.setHidesBackButton(true)5�_�                      
    ����                                                                                                                                                                                                                                                                                                                                                             W�f    �         O          �         P          adsfasdfasdf5�_�                       
    ����                                                                                                                                                                                                                                                                                                                                                             W�     �         P          �         Q          asdfasfasd5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             W��   	 �         Q          �         R          adfasfasd5�_�                       
    ����                                                                                                                                                                                                                                                                                                                                                             W�1    �         O          �         P          adsfasdf       adsfasdfsd5��