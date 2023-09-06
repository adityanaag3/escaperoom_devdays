OrderCreator.createOrders();

User u = new User();
u.FirstName = 'Codey';
u.LastName = 'Bear';
u.Email = 'atopalli@salesforce.com';
u.Username = 'codey208@devdays23jai.com';
u.ProfileId = [select Id from Profile where Name = 'Sys Admin without Apex'].Id;
u.Alias = 'cbear';
u.TimeZoneSidKey = 'Asia/Kolkata'; 
u.LocaleSidKey = 'en_US';
u.EmailEncodingKey = 'UTF-8';
u.LanguageLocaleKey = 'en_US';
insert u;

system.setPassword(u.Id, 'sfdc2023');