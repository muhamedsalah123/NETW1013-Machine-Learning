function [A B] =lineExpect(m,n)
firstsum = sum(m);
secondsum = sum(n);
[sumfirstsquared,nfirst] = sumsqr(m);
[sumsecondquared,nsecond] = sumsqr(n);
product=m.*n;
sumofproduct=sum(product);
A=((secondsum*sumfirstsquared)-(firstsum*sumofproduct))/((nfirst*sumfirstsquared)-power(firstsum,2));
B=((nfirst*sumofproduct)-(firstsum*secondsum))/((nfirst*sumfirstsquared)-power(firstsum,2));
end

