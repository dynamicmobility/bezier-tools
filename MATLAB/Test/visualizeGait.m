% Read YAML 
yaml = read_yaml('jt_bez_10.yaml');

% Load properties from yaml
step_dur = yaml.step_dur;
coeff_jt = yaml.coeff_jt;

num_outputs = length(yaml.startingPos);

% Need to reshape coeff to be a matrix with N rows and M columns
coeff_jt = reshape(coeff_jt,num_outputs,[]);

% Differentiate Coefficients
dcoeff_jt = differentiateBezierCoefficients(coeff_jt);

% Evaluation Points
tau = linspace(0,1);

% Evaluate Bezier
qdes = bezier(coeff_jt,tau);
dqdes = bezier(dcoeff_jt,tau)*(1/step_dur);

% Plot 
figure(1); clf;
tiledlayout('flow');
for i = 1:num_outputs
    nexttile;
    plot(tau,qdes(i,:));
    title(sprintf('Output %i',i));
    xlabel('Tau');
    ylabel('Pos');
end


figure(2); clf;
tiledlayout('flow');
for i = 1:num_outputs
    nexttile;
    plot(tau,dqdes(i,:));
    title(sprintf('Output %i',i));
    xlabel('Tau');
    ylabel('Vel');
end

%% Alternative Approach Using dbezier

dqdes2 = dbezier(coeff_jt,tau,step_dur);

figure(3); clf;
tiledlayout('flow');
for i = 1:num_outputs
    nexttile;
    plot(tau,dqdes2(i,:));
    title(sprintf('Output %i',i));
    xlabel('Tau');
    ylabel('Vel');
end