export class Paint{

    canvas;
    ctx;
    prevMouseX; 
    prevMouseY; 
    snapshot;
    isDrawing = false;
    selectedTool = "pencil";
    brushWidth = 5;
    selectedColor = "#000";
    colorBtns = document.querySelectorAll("#colors .color")
    toolBtns; 
    color1;

     constructor(div){
        this.canvas = div.querySelector('canvas');
        this.color1 = div.querySelector('#color1');

        this.canvas.width = this.canvas.offsetWidth
        this.canvas.height = this.canvas.offsetHeight
        
        this.ctx = this.canvas.getContext("2d")

        this.canvas.addEventListener("mousedown",this.startDraw)
        this.canvas.addEventListener("mousemove",this.drawing)
        this.canvas.addEventListener("mouseup", () => { this.isDrawing = false })

        this.canvas.addEventListener("touchstart",(e) => {this.startDraw(e,true)})
        this.canvas.addEventListener("touchmove",(e) => {this.drawing(e,true)})
        this.canvas.addEventListener("touchend", () => {this.isDrawing = false })

        this.setCanvasBackground();

        this.colorBtns.forEach(btn => {
            btn.addEventListener("click", () =>{
                let selected = document.querySelector(".options .selected")
                if(selected){ 
                    selected.classList.remove("selected");
                }

                btn.classList.add("selected")
                this.selectedColor = window.getComputedStyle(btn).getPropertyValue("background-color")
                this.color1.style.backgroundColor = this.selectedColor
            })
        })

        this.toolBtns = div.querySelectorAll('#tool-grid .tool')
        this.toolBtns.forEach((tool) => { 
            tool.addEventListener("click",()=>{
                if(!tool.classList.contains('disabled')){
                    div.querySelector('#tool-grid .tool.active').classList.remove("active");
                    tool.classList.add("active")
                    this.selectedTool = tool.id
                }
            })
        })
    }

    setCanvasBackground = () => {
        this.ctx.fillStyle = "#fff";
        this.ctx.fillRect(0,0,this.canvas.width,this.canvas.height);
        this.ctx.fillStyle = this.selectedColor;
        this.snapshot = this.ctx.getImageData(0,0,this.canvas.width,this.canvas.height)
    }

    drawing = (e,touch = false) =>{

        if(!this.isDrawing) return;

        let x = e.offsetX;
        let y = e.offsetY;

        if(touch){
            e.preventDefault(); 
            const touch = e.touches[0];
            const rect = this.canvas.getBoundingClientRect(); // Get the canvas position relative to viewport
            x = touch.clientX - rect.left;
            y = touch.clientY - rect.top;
        }

        this.ctx.putImageData(this.snapshot,0,0);

        if(this.selectedTool === "pencil" || this.selectedTool === "eraser"){
            this.ctx.strokeStyle = this.selectedTool === "eraser" ? "#fff" : this.selectedColor; 
            this.ctx.lineTo(x,y);
            this.ctx.stroke()
        }else if(this.selectedTool === "square"){
            this.drawRect(x,y);
        }else if(this.selectedTool === "oval"){
            this.drawEllipse(x,y);
        }else if(this.selectedTool === "line"){
            this.drawLine(x,y);
        }
    }

    dropper = (x,y) => {
        const data = this.ctx.getImageData(Math.round(x),Math.round(y), 1, 1).data;
        const hex = this.rgbToHex(data[0],data[1],data[2])

        this.selectedColor = hex;
        this.color1.style.backgroundColor = hex;
    }

    rgbToHex(r, g, b) {
        return "#" + (1 << 24 | r << 16 | g << 8 | b).toString(16).slice(1);
    }

    drawEllipse = (x2, y2) => {
      
        const centerX = (this.prevMouseX + x2) / 2;
        const centerY = (this.prevMouseY + y2) / 2;

        const width = Math.abs(x2 - this.prevMouseX) / 2;
        const height = Math.abs(y2 - this.prevMouseY) / 2;

        this.ctx.beginPath();
        this.ctx.ellipse(centerX, centerY, width, height, 0, 0, Math.PI * 2);
        this.ctx.strokeStyle = this.selectedColor;
        this.ctx.stroke();
    }

    drawRect = (offsetX,offsetY) => {
        this.ctx.strokeRect(offsetX,offsetY,this.prevMouseX - offsetX,this.prevMouseY - offsetY);
    }

    drawLine = (offsetX,offsetY) => {
        this.ctx.beginPath();
        this.ctx.moveTo(this.prevMouseX,this.prevMouseY);
        this.ctx.lineTo(offsetX,offsetY)
        this.ctx.stroke();
    }

    startDraw = (e,touch = false) => {
        let x = e.offsetX;
        let y = e.offsetY;

        if(touch){
            e.preventDefault(); // Prevent scrolling

            const touch = e.touches[0];
            const rect = this.canvas.getBoundingClientRect(); // Get the canvas position relative to viewport
            x = touch.clientX - rect.left;
            y = touch.clientY - rect.top;
        }

        this.isDrawing = true;
        this.prevMouseX = x
        this.prevMouseY = y
        this.ctx.beginPath();
        this.ctx.lineWidth = this.brushWidth;
        this.ctx.strokeStyle = this.selectedColor;
        this.ctx.fillStyle = this.selectedColor;
        this.snapshot = this.ctx.getImageData(0,0,this.canvas.width,this.canvas.height)

        if(this.selectedTool === "dropper"){
            this.dropper(x,y);
        }
    }
}