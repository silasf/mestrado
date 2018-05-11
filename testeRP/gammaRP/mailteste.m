% % Define these variables appropriately: Yaooo
% mail = 'silassouzaf@yahoo.com.br'; %Your Yahoo email address
% password = 'abracadabra';  %Your Yahoo password
% setpref('Internet','SMTP_Server','smtp.mail.yahoo.com');

% Define these variables appropriately:
mail = 'resptestserv@gmail.com'; %Your GMail email address
mailDest = 'silassouzaf@yahoo.com.br'; % email destino
password = 'Abracadabra';  %Your GMail password
setpref('Internet','SMTP_Server','smtp.gmail.com');

setpref('Internet','E_mail',mail);
setpref('Internet','SMTP_Username',mail);
setpref('Internet','SMTP_Password',password);
props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');

sendmail(mailDest,'Hello From MATLAB!');
