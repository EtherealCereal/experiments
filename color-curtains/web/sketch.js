/* global p5 */
// Adapted from Carl's moving_squares: five translucent marks per 10 Hz tick.
// The canvas persists. Earlier marks are gradually covered, never faded explicitly.
const mix=(a,b,t)=>a+(b-a)*t;
const clamp=x=>Math.max(0,Math.min(1,x));
function nextPaint(widthMin,widthMax,alphaMin,alphaMax,level,high,rng=Math.random){
  const x=rng();
  const width=mix(widthMin,widthMax,rng());
  // Position-dependent color, as in moving_squares, adapted to the video palette.
  const warm=clamp((x-0.42)/0.48);
  const color=[mix(5,245,warm)+rng()*10,mix(175,115,warm)+rng()*90,210+rng()*45];
  return {x,width,color,alpha:clamp(mix(alphaMin,alphaMax,rng())*(1+level*1.5+high*0.5))};
}
// Keep range endpoints ordered when either slider is moved.
const defaults={speed:1,'width-min':0.2,'width-max':6,'alpha-min':0,'alpha-max':12};
function showControl(id){
  const value=Number(document.getElementById(id).value);
  document.getElementById(id+'-value').textContent=id==='speed'?`${value}× · ${Math.round(value*50)} rectangles/sec`:`${value}%`;
}
for(const id of Object.keys(defaults)){
  document.getElementById(id).addEventListener('input',()=>{
    if(id!=='speed'){
      const [kind,end]=id.split('-');
      const other=kind+(end==='min'?'-max':'-min');
      const current=document.getElementById(id),partner=document.getElementById(other);
      if((end==='min'&&Number(current.value)>Number(partner.value))||(end==='max'&&Number(current.value)<Number(partner.value)))partner.value=current.value;
      showControl(other);
    }
    showControl(id);
  });
  showControl(id);
}
document.getElementById('defaults').onclick=()=>{
  for(const [id,value] of Object.entries(defaults)){document.getElementById(id).value=value;showControl(id);}
};
const audio=document.querySelector('#audio');
const status=document.querySelector('#status');
let context,analyser,spectrum,waveform,fileURL;
let paused=matchMedia('(prefers-reduced-motion: reduce)').matches;
let bass=0,level=0,high=0;
const motion=document.querySelector('#motion');
motion.textContent=paused?'Resume motion':'Pause motion';
motion.onclick=()=>{paused=!paused;motion.textContent=paused?'Resume motion':'Pause motion';};
document.querySelector('#fullscreen').onclick=async()=>{
  try{await document.querySelector('#stage').requestFullscreen();}
  catch{status.textContent='Fullscreen is unavailable in this browser.';}
};
function connectAudio(){
  if(context)return;
  context=new AudioContext();
  analyser=context.createAnalyser();analyser.fftSize=2048;analyser.smoothingTimeConstant=0.8;
  const source=context.createMediaElementSource(audio);
  source.connect(analyser);analyser.connect(context.destination);
  spectrum=new Uint8Array(analyser.frequencyBinCount);waveform=new Float32Array(analyser.fftSize);
}
document.querySelector('#file').onchange=event=>{
  const file=event.target.files[0];if(!file)return;
  audio.pause();if(fileURL)URL.revokeObjectURL(fileURL);
  fileURL=URL.createObjectURL(file);audio.src=fileURL;
  status.textContent=`${file.name} — press Play to animate with audio.`;
};
audio.addEventListener('play',async()=>{
  try{connectAudio();await context.resume();status.textContent='Audio active: bass adds layers faster; volume and highs increase their opacity.';}
  catch{status.textContent='Audio analysis could not start. Try another browser or reload.';}
});
audio.addEventListener('error',()=>{status.textContent='This audio format could not be played. Try an MP3 or WAV file.';});
function band(lo,hi){
  const bin=context.sampleRate/analyser.fftSize;
  let sum=0,count=0;
  for(let i=Math.max(1,Math.ceil(lo/bin));i<=Math.min(spectrum.length-1,Math.floor(hi/bin));i++){sum+=spectrum[i]/255;count++;}
  return count?sum/count:0;
}
new p5(p=>{
  let elapsed=0;
  p.setup=()=>{
    p.createCanvas(960,560).parent('stage');p.pixelDensity(1);p.frameRate(30);p.noStroke();p.background(255);
    document.querySelector('#reset').onclick=()=>{p.background(255);elapsed=0;};
  };
  p.draw=()=>{
    if(paused)return;
    const response=Number(document.querySelector('#response').value);
    let b=0,l=0,h=0;
    if(analyser&&!audio.paused){
      analyser.getByteFrequencyData(spectrum);analyser.getFloatTimeDomainData(waveform);
      b=band(30,180);h=band(3000,10000);
      l=Math.sqrt(waveform.reduce((s,v)=>s+v*v,0)/waveform.length)*3;
    }
    bass=mix(bass,clamp(b*response),0.12);level=mix(level,clamp(l*response),0.12);high=mix(high,clamp(h*response),0.12);
    elapsed+=Math.min(p.deltaTime,100)/1000*Number(document.querySelector('#speed').value)*(1+bass);
    const widthMin=Number(document.getElementById('width-min').value)/100;
    const widthMax=Number(document.getElementById('width-max').value)/100;
    const alphaMin=Number(document.getElementById('alpha-min').value)/100;
    const alphaMax=Number(document.getElementById('alpha-max').value)/100;
    while(elapsed>=0.1){
      elapsed-=0.1;
      for(let i=0;i<5;i++){
        const mark=nextPaint(widthMin,widthMax,alphaMin,alphaMax,level,high);
        p.fill(...mark.color,mark.alpha*255);p.rect(mark.x*p.width,0,mark.width*p.width,p.height);
      }
    }
  };
});
