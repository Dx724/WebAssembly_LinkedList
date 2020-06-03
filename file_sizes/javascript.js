class A{constructor(B,C){this.B=B;this.C=C;}}
var D=new A(3,null);var F=new A(2,D);var G=new A(1,F);var H=G;while(H!=null){console.log(H.B);H=H.C;}