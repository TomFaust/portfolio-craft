export class Tablist{

    tabs = [];
    pages = [];
    activeAttribute = null;

    constructor(tabWindow,tabIdentifier,pageIdentifier,activeAttribute = null){
        this.tabs = tabWindow.querySelectorAll(tabIdentifier);
        this.pages = tabWindow.querySelectorAll(pageIdentifier);
        this.activeAttribute = activeAttribute;

        this.tabs.forEach((tab) =>{
            tab.addEventListener('click', () =>{
                this.SwitchTab(tab)
            })
        })

        this.pages.forEach((page) =>{
            page.classList.add('d-none');
        })

        this.pages[0].classList.remove('d-none');
        this.tabs[0].setAttribute(activeAttribute,'true')
    }

    SwitchTab(selectedTab){
        this.tabs.forEach((tab,key) => {
            if(tab == selectedTab){
                tab.setAttribute(this.activeAttribute,'true')
                this.pages[key].classList.remove('d-none');
            }else{
                tab.setAttribute(this.activeAttribute,'false')
                this.pages[key].classList.add('d-none');
            }
        })
    }

}
