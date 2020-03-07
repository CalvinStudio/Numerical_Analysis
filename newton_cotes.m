% n��ţ��-�ƴ������ʽ
% ˼·: �Ƚ�[a,b]����n�ȷ�, Ȼ��n+1������n+1��(n��)�������ղ�ֵ
% ȱ��: �߽��������ղ�ֵ���ڸ������������������������أ���Ҫ���6�ף�
% ��f(x) = 4/(1+x^2)����Ϊ��

clear; clc;

up = double(input('�����������:'));
low = double(input('�����������:'));
n = double(input('���������򼸵ȷ�(�����������ղ�ֵ����ʽ):'));

% �㵱ǰn�ȷ�ţ��-�ƴ�ϵ��Cn 
Cn = zeros(1,n+1); 
syms t;
% s=sym(1)���ű������͵�1, ��Ҫ��Ϊ��һ��ʼ��ѭ�����
for i = 0:n
    s = sym(1);
    for num = 0:n
        if num ~= i
            s = s*(t-num);
        end
    end
    Cn(i+1) = (-1)^(n-i)/( n*factorial(i)*factorial(n-i) )*int(s,t,0,n)
end

syms x;
f = 4/(1+x^2);  % ÿ���޸�����ĺ���
R = int(f,x,low,up);    % ��ʵ���
x = low:(up-low)/n:up;  % n�ȷֺ�ÿ�����xֵ
fx = double(subs(f));   % n�ȷֺ�ÿ��x���Ӧ�ĺ���ֵ

% ���ƽ��Ϊ:
NC = (up-low)*sum(Cn.*fx);
fprintf('ţ��-�ƴ������ʽ���ƽ��Ϊ: %.7f\n',NC);
fprintf('��ʵ���Ϊ: %f\n',R);

