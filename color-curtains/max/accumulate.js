/* eslint-disable @typescript-eslint/no-unused-vars -- Max calls these named message handlers. */
/* global JitterMatrix, outlet */
/* exported bang, reset, density, bass, level, high, loadbang */
// Max js: persistent float RGB history, uploaded as a one-row ARGB matrix.
// Full-height rectangles have identical pixels in each row; stretch in Jitter.
var pixels=[], matrix=new JitterMatrix(4,'char',960,1);
var bandDensity=1, bassValue=0, levelValue=0, highValue=0, carry=0;
function clamp(x){return Math.max(0,Math.min(1,x));}
function density(x){bandDensity=Math.max(0.5,Math.min(2,x));}
function bass(x){bassValue=clamp(x);}
function level(x){levelValue=clamp(x);}
function high(x){highValue=clamp(x);}
function output(){
  for(var x=0;x<960;x++)matrix.setcell2d(x,0,255,Math.round(pixels[x*3]),Math.round(pixels[x*3+1]),Math.round(pixels[x*3+2]));
  outlet(0,'jit_matrix',matrix.name);
}
function reset(){for(var i=0;i<960*3;i++)pixels[i]=255;carry=0;output();}
function loadbang(){reset();}
function bang(){
  if(!pixels.length)reset();
  carry+=5*(1+bassValue);
  while(carry>=1){
    carry-=1;
    var x=Math.random(), w=(0.002+Math.random()*0.058)/bandDensity;
    var warm=clamp((x-0.42)/0.48);
    var c=[5+240*warm+Math.random()*10,175-60*warm+Math.random()*90,210+Math.random()*45];
    var a=Math.random()*30/255*(1+levelValue*1.5+highValue*0.5);
    for(var col=Math.floor(x*960);col<Math.min(960,Math.ceil((x+w)*960));col++){
      for(var k=0;k<3;k++)pixels[col*3+k]+=a*(Math.min(255,c[k])-pixels[col*3+k]);
    }
  }
  output();
}
