import { MaskIcon } from "./mask_icon.js";
import { DoubletapHandler } from "../managers/doubletap_handler.js";
import eventDispatcher from '../managers/event_dispatcher.js';

export class FileExplorer{

    icons;
    panels;
    select;
    foldericons;
    programs;
    count;

    constructor(root){
        
        this.icons = root.querySelectorAll('.clickableIcon');
        this.panels = root.querySelectorAll('.folderPanel');
        this.select = root.querySelector('.address_select');
        this.folderIcons = root.querySelectorAll('.folderIcon');
        this.programs = root.querySelectorAll('.openingIcon');
        this.count = root.querySelector('#objects');

        this.folderIcons.forEach(folderIcon =>{
            new MaskIcon(folderIcon)
        })

        this.countObjects(this.panels[0])

        eventDispatcher.addEventListener('history-change',(e) =>{
            if(e.detail.window == root){
                this.countObjects(e.detail.screen)
            }
        })

        if(this.icons && this.panels){
            let option = document.createElement('option');
                option.innerText = "C:/portfolio/past_work/";
                option.value = "main";
                this.select.appendChild(option);

            this.icons.forEach(icon =>{

                let option = document.createElement('option');
                option.innerText = "C:/portfolio/past_work/" + this.getPanelChainTitles(icon.dataset.panel);
                option.value = icon.dataset.panel;
                this.select.appendChild(option);

                icon.addEventListener('dblclick',(e)=>{
                    this.swapPanels(icon)
                },true);

                new DoubletapHandler(icon,() =>{this.swapPanels(icon)})

            })
            
            this.programs.forEach(program =>{
                program.addEventListener('dblclick', () =>{ window.open(program.dataset.url)  })
                new DoubletapHandler(program,() =>{ window.open(program.dataset.url) })
            })

            this.select.value = "main"
        }
        
    }

    getPanelChainTitles(startPanel) {
        const panels = document.querySelectorAll(".folderPanel");
        const panelMap = {};
        const titleMap = {};
    
        // Map data-panel to corresponding data-subject and data-title
        panels.forEach(panel => {
            const subject = panel.getAttribute("data-subject");
            const icons = panel.querySelectorAll(".folderIcon");
            icons.forEach(icon => {
                const panelId = icon.getAttribute("data-panel");
                const title = icon.querySelector("label")?.textContent.trim(); // Fetch title from label
                if (panelId) {
                    panelMap[panelId] = subject;
                    titleMap[panelId] = title; // Store the title for the chain
                }
            });
        });
    
        // Start from the initial panel and build the chain using titles
        let chain = [];
        let currentPanel = startPanel;
    
        while (currentPanel && titleMap[currentPanel]) {
            let processedTitle = titleMap[currentPanel]
                .toLowerCase() // Convert to lowercase
                .replace(/\s+/g, "_"); // Replace spaces with underscores
            chain.push(processedTitle); // Add the processed title to the chain
            currentPanel = panelMap[currentPanel];
        }
    
        return chain.reverse().join(" / "); // Combine titles into a chain
    }
    

    swapPanels(icon){
        this.panels.forEach(panel => {
            if(panel.dataset.subject === icon.dataset.panel){
                this.select.value = icon.dataset.panel;
                panel.classList.remove('d-none');
                this.countObjects(panel);
            }else{
                panel.classList.add('d-none');
            }
        })
    }

    countObjects(panel){
        let icons = panel.querySelectorAll(".folderIcon");
        this.count.innerText = icons.length;
    }
}
