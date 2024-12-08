localStorage.hasOwnProperty("cursor")&&u(localStorage.getItem("cursor"));let d=document.getElementsByClassName("cursorOptions");for(let e=0;e<d.length;e++)d[e].addEventListener("click",g);function g(e){u(e.target.closest("a").id)}function u(e){if(localStorage.setItem("cursor",e),e){var t=document.getElementById("customCursorStyle");t||(t=document.createElement("style"),t.id="customCursorStyle",document.head.appendChild(t)),t.textContent=`
            body {
              cursor: url('assets/${e}Cursor/normal.cur'), auto !important;
            }
    
            .pointer {
              cursor: url('assets/${e}Cursor/pointer.cur'), pointer !important;
            }
        `}else{var t=document.getElementById("customCursorStyle");t&&(t.textContent="")}}document.getElementById("file").addEventListener("change",e=>{const t=e.target.files[0],r=new FileReader;r.onloadend=()=>{const o=r.result.replace("data:","").replace(/^.+,/,"");localStorage.setItem("wallpaper",o),document.body.style.backgroundImage=`url(data:image/png;base64,${o})`},r.readAsDataURL(t)});localStorage.hasOwnProperty("wallpaper")&&(document.body.style.backgroundImage=`url(data:image/png;base64,${localStorage.getItem("wallpaper")})`);document.getElementById("openImgUpload").addEventListener("click",()=>{document.getElementById("file").click()});document.getElementById("removeBackground").addEventListener("click",()=>{document.body.style.backgroundImage="",localStorage.removeItem("wallpaper")});function i(e,t,r){let o=[],n=[5.2,116.14,66.66,117.18];for(let a=0;a<n.length;a++){let l=e,s=t,c=r;l=Math.floor(l/100*n[a]),s=Math.floor(s/100*n[a]),c=Math.floor(c/100*n[a]),o[a]=l+" "+s+" "+c}return o}localStorage.hasOwnProperty("BGColor")&&m(localStorage.getItem("BGColor"));function m(e){console.log(e);let t=document.getElementsByClassName("range"),r=document.getElementsByTagName("style")[0],o=i(t[0].value,t[1].value,t[2].value);r.innerHTML=`
    .window,.dropdown,button,.tab,#clock{
        background-color:${e};
        box-shadow:inset -1px -1px rgb(${o[0]}), inset 1px 1px rgb(${o[1]}), inset -2px -2px rgb(${o[2]}), inset 2px 2px rgb(${o[3]})
    }
    .openTab{
        box-shadow:inset -1px -1px rgb(${o[3]}), inset 1px 1px rgb(${o[2]}), inset -2px -2px rgb(${o[1]}), inset 2px 2px rgb(${o[0]})
    }
    `}
