require "spec_helper"
require "sunspot/rails/spec_helper"

describe InterestMailer do
 
 	disconnect_sunspot

 	context "student to student contact" do

	  before do
	  	@student = FactoryGirl.create(:user)
	    @student2 = FactoryGirl.create(:user, id: 3, activated: true, email: "student2@student2.com")
	  end
   
    it "sends an e-mail to correct student from student" do
     	@email = InterestMailer.s2s_pending_connection(@student,@student2)
      @email.to.join.should == @student.email
    end
  
    it "sends an e-mail with a reply-to field for the correct student" do
     	@email = InterestMailer.s2s_pending_connection(@student,@student2)
      @email.reply.to.join.should == @student2.email
    end
  
    it "sends an e-mail from DBCFinalProject" do
     	@email = InterestMailer.s2s_pending_connection(@student,@student2)
      @email.from.join.should == "dbcfinalproject@gmail.com"
    end

  end

  context "student to employer initial email" do

  	before do
  		@student = FactoryGirl.create(:user)
  	  @company = FactoryGirl.create(:company, activated: false)
      @cohort = FactoryGirl.create(:cohort)
      @employer = FactoryGirl.create(:user, id: 4, groupable_type: "Company", 
      															groupable_id: @company.id, email: "employer@employer.com")
      @question = FactoryGirl.create(:question)
      @answer = FactoryGirl.create(:answer)
  	end

  	it "sends an email to correct employer" do 
       # Looks like @email is used repeatedly in all of these tests. This can be moved up
       # to the before block.
  		 @email = InterestMailer.student_initiated_email(@employer,@student,[[@question,@answer],[@question,@answer]])
  		 @email.to.join.should == @employer.email
  	end	

  	it "sends an email with reply-to correct student" do 
  		 @email = InterestMailer.student_initiated_email(@employer,@student,[[@question,@answer],[@question,@answer]])
  		 @email.reply.to.join.should == @student.email
  	end	

  	it "sends an email with from field of dbcfinalproject@gmail.com" do 
  		 @email = InterestMailer.student_initiated_email(@employer,@student,[[@question,@answer],[@question,@answer]])
  		 @email.from.join.should == "dbcfinalproject@gmail.com"
  	end

  	it "sends email with correct subject" do 
  		 @email = InterestMailer.student_initiated_email(@employer,@student,[[@question,@answer],[@question,@answer]])
  		 @email.subject.should == "Someone's Interested"
  	end		

  end

  context "employer to student initial email" do

  	before do
  		@student = FactoryGirl.create(:user)
  	  @company = FactoryGirl.create(:company, activated: false)
      @cohort = FactoryGirl.create(:cohort)
      @employer = FactoryGirl.create(:user, id: 4, groupable_type: "Company", 
      															groupable_id: @company.id, email: "employer@employer.com")
      @question = FactoryGirl.create(:question)
      @answer = FactoryGirl.create(:answer)
  	end

  	it "sends an email to correct employer" do 
       # Looks like @email is used repeatedly in all of these tests. This can be moved up
       # to the before block.
  		 @email = InterestMailer.employer_initiated_email(@student,@employer)
       # Assuming @email.to is an array? If so, why not test:
       # @email.to.shold == [@student.email]
  		 @email.to.join.should == @student.email
  	end	

  	it "sends an email with reply-to correct student" do 
  		 @email = InterestMailer.employer_initiated_email(@student,@employer)
  		 @email.reply.to.join.should == @employer.email
  	end	

  	it "sends an email with from field of dbcfinalproject@gmail.com" do 
  		 @email = InterestMailer.employer_initiated_email(@student,@employer)
  		 @email.from.join.should == "dbcfinalproject@gmail.com"
  	end

  	it "sends email with correct subject" do 
  		 @email = InterestMailer.employer_initiated_email(@student,@employer)
  		 @email.subject.should == "Someone's Interested"
  	end		

	end

end
