import { DoubletapHandler } from "../managers/doubletap_handler.js";
import eventDispatcher from '../managers/event_dispatcher.js';

export class History{

    forward = null;
    backward = null;

    screens = [];

    history = [];
    historyPos = 0;
    
    interactibles = [];
    holders = [];

    window;

    constructor(window,interactibles,attribute,holders,screens,action){
        this.window = window
        this.forward = window.querySelector(".forward");
        this.backward = window.querySelector(".backward");

        this.interactibles = window.querySelectorAll(interactibles);
        if(holders){
            this.holders = window.querySelectorAll(holders);
        }

        this.screens = window.querySelectorAll(screens);
        this.history.push(this.screens[0].dataset.subject)
        

        this.interactibles.forEach(interactible => {
            interactible.addEventListener(action,(e)=>{

                //since the attribute can be determined elsewhere via string, we are accessing it like so
                let newEntry = attribute.split('.').reduce((obj, key) => obj[key], interactible);

                if(this.history[this.historyPos] !== newEntry){
                    this.history = this.history.slice(0, this.historyPos + 1);

                    this.history.push(newEntry);
                    this.historyPos++;

                    this.backward.disabled = false;
                    this.forward.disabled = true;
                }
                
            })

            if(action === "dblclick"){
                new DoubletapHandler(interactible, () =>{
                    let newEntry = attribute.split('.').reduce((obj, key) => obj[key], interactible);
                    
                    if(this.history[this.historyPos] !== newEntry){
                        this.history = this.history.slice(0, this.historyPos + 1);

                        this.history.push(newEntry);
                        this.historyPos++;
                
                        this.backward.disabled = false;
                        this.forward.disabled = true;
                    }
                })
            }
        })


        this.backward.addEventListener('click',()=>{
            this.Backward();
        })

        this.forward.addEventListener('click',()=>{
            this.Forward();
        })
    }

    Backward(){

        this.forward.disabled = false;

        if(this.historyPos > 0){
            this.historyPos--;
            if(this.historyPos < 1){
                this.backward.disabled = true;
            }else{
                this.backward.disabled = false;
            }
        }
        this.switchSubject();
    }

    Forward(){

        this.backward.disabled = false;

        if(this.historyPos < this.history.length - 1){
            this.historyPos++;
            if(this.historyPos == this.history.length - 1){
                this.forward.disabled = true;
            }else{
                this.forward.disabled = false;
            }
        }
        this.switchSubject();
    }

    switchSubject(){
        this.holders.forEach(holder =>{
            holder.value = this.history[this.historyPos];
        })

        this.screens.forEach(screen => {
            if(screen.dataset.subject == this.history[this.historyPos]){
                screen.classList.remove('d-none');

                const historyEvent = new CustomEvent("history-change", { bubbles: true, detail: {
                    screen: screen,
                    window: this.window
                }});

                eventDispatcher.dispatchEvent(historyEvent)

            }else{
                screen.classList.add('d-none');
            }
        })
          
    }

}