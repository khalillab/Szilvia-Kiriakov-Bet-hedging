%% PARAMETERS

% number of cycles
gen =10;

% population fractions
%fraction of [RNQ+] cells
RNQ1 = zeros(gen,1);
%fraction of [rnq-] cells
rnq2 = zeros(gen,1);
%fraction of [RNQ+] mutant cells
RNQ3 = zeros(gen,1);
%fraction of [rnq-] mutant cells
rnq4 = zeros(gen,1);

% initital population composition
RNQ1(1) = 0.5;
rnq2(1) = 0.5;
RNQ3(1) = 0;
rnq4(1) = 0;


%% loop with each entry being a hygromycin treatment followed by recovery followed by canavanine treatment followed by recovery

i = 1;

while i <= gen

    %hygromycin treatment
    %new RNQ+ fraction
    x1 = RNQ1(i)*2.42*10^(-5)*0.472;
    %new rnq- fraction
    x2 = rnq2(i)*0.959 + RNQ1(i)*2.42*10^(-5)*0.528*0.05;
    %new RNQ+ mutant fraction
    x3 = RNQ3(i)*0.959 + RNQ1(i)*2.42*10^(-5)*0.528*0.95;
    %new rnq- mutant fraction
    x4 = rnq4(i)*0.959;
    
    i = i + 1;
     
    %recovery: normalizing fractions to 1 and storing them
    RNQ1(i) = x1 / (x1+x2+x3+x4);
    rnq2(i) = x2 / (x1+x2+x3+x4);
    RNQ3(i) = x3 / (x1+x2+x3+x4);
    rnq4(i) = x4 / (x1+x2+x3+x4);
   
    %canavanine treatment
    %new RNQ+ fraction
    x1 = RNQ1(i) * 0.0551 + rnq2(i) * 4.34*10^(-5)*0.1521*0.05;
    % new rnq- fraction
    x2 = rnq2(i) * 4.34*10^(-5) * 0.8479;
    % new RNQ+ mutant fraction
    x3 = RNQ3(i) * 0.0551;
    % new rnq- mutant fraction
    x4 = rnq4(i) * 0.0551 + rnq2(i) * 4.34*10^(-5)*0.1521*0.95;
    
    i= i + 1;
    
    %recovery: normalizing fractions to 1 and storing them
    RNQ1(i) = x1 / (x1+x2+x3+x4);
    rnq2(i) = x2 / (x1+x2+x3+x4);
    RNQ3(i) = x3 / (x1+x2+x3+x4);
    rnq4(i) = x4 / (x1+x2+x3+x4);
    
    
end
    
gen = length(RNQ1);    
%% plotting results

% each type is a different line

figure
hold on
plot(1:gen,RNQ1,'r-')
plot(1:gen,rnq2,'b.-')
plot(1:gen,RNQ3,'k-')
plot(1:gen,rnq4,'go-')

title({'[RNQ+] - red, [rnq-] - blue' ,'mutant [RNQ+] - black, mutant [rnq-] - green'})
xlabel('environmental fluctuations')
ylabel('frequency in population')
set(gca,'XMinorTick','on','YMinorTick','on')



