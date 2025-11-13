function f=fib(n,p)
if n<=2
    f=1;
else
    f=fib(n-1,p)+fib(n-2,p);
    f=mod(f,p);
end