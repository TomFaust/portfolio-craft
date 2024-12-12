localStorage.hasOwnProperty("cursor")&&i(localStorage.getItem("cursor"));let s=document.querySelectorAll("#cursorOptions li");for(let e=0;e<s.length;e++)s[e].addEventListener("click",u);function u(e){i(e.target.closest("li").dataset.entryid)}async function i(e){if(localStorage.setItem("cursor",e),e){var t=document.getElementById("customCursorStyle");t||(t=document.createElement("style"),t.id="customCursorStyle",document.head.appendChild(t)),await fetch("/actions/_portfolio-core/cursor/get-cursors",{method:"POST",headers:{Accept:"application/json","Content-Type":"application/json"},body:JSON.stringify({entryId:e,[window.Craft.csrfTokenName]:window.Craft.csrfTokenValue})}).then(n=>n.json()).then(n=>{t.textContent=`
                body, *:enabled{
                    cursor: url('${n.normal}'), auto !important;
                }

                .pointer, *:enabled{
                    cursor: url('${n.pointer}'), pointer !important;
                }
            `})}else{var t=document.getElementById("customCursorStyle");t&&(t.textContent="")}}document.getElementById("file").addEventListener("change",e=>{const t=e.target.files[0],n=new FileReader;n.onloadend=()=>{const o=n.result.replace("data:","").replace(/^.+,/,"");localStorage.setItem("wallpaper",o),document.body.style.backgroundImage=`url(data:image/png;base64,${o})`},n.readAsDataURL(t)});localStorage.hasOwnProperty("wallpaper")&&(document.body.style.backgroundImage=`url(data:image/png;base64,${localStorage.getItem("wallpaper")})`);document.getElementById("openImgUpload").addEventListener("click",()=>{document.getElementById("file").click()});document.getElementById("removeBackground").addEventListener("click",()=>{document.body.style.backgroundImage="",localStorage.removeItem("wallpaper")});function p(e,t,n){let o=[],a=[5.2,116.14,66.66,117.18];for(let r=0;r<a.length;r++){let l=e,c=t,d=n;l=Math.floor(l/100*a[r]),c=Math.floor(c/100*a[r]),d=Math.floor(d/100*a[r]),o[r]=l+" "+c+" "+d}return o}localStorage.hasOwnProperty("BGColor")&&g(localStorage.getItem("BGColor"));function g(e){console.log(e);let t=document.getElementsByClassName("range"),n=document.getElementsByTagName("style")[0],o=p(t[0].value,t[1].value,t[2].value);n.innerHTML=`
    .window,.dropdown,button,.tab,#clock{
        background-color:${e};
        box-shadow:inset -1px -1px rgb(${o[0]}), inset 1px 1px rgb(${o[1]}), inset -2px -2px rgb(${o[2]}), inset 2px 2px rgb(${o[3]})
    }
    .openTab{
        box-shadow:inset -1px -1px rgb(${o[3]}), inset 1px 1px rgb(${o[2]}), inset -2px -2px rgb(${o[1]}), inset 2px 2px rgb(${o[0]})
    }
    `}
