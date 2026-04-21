export class Paint{

    canvas;
    ctx;
    prevMouseX; 
    prevMouseY; 
    snapshot;
    isDrawing = false;
    selectedTool = "brush";
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

        this.canvas.addEventListener("touchstart",this.startDrawTouch)
        this.canvas.addEventListener("touchmove",this.drawingTouch)
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

    startDrawTouch = (e) => {
        e.preventDefault(); // Prevent scrolling

        const touch = e.touches[0];
        const rect = this.canvas.getBoundingClientRect(); // Get the canvas position relative to viewport
        const touchX = touch.clientX - rect.left;
        const touchY = touch.clientY - rect.top;

        this.isDrawing = true;
        this.prevMouseX = touchX;
        this.prevMouseY = touchY;
        this.ctx.beginPath();
        this.ctx.lineWidth = this.brushWidth;
        this.ctx.strokeStyle = this.selectedColor;
        this.ctx.fillStyle = this.selectedColor;
        this.snapshot = this.ctx.getImageData(0, 0, this.canvas.width, this.canvas.height);
    }

    drawingTouch = (e) => {
        e.preventDefault(); // Prevent scrolling

        if (!this.isDrawing) return;
        
        const touch = e.touches[0];
        const rect = this.canvas.getBoundingClientRect(); // Get the canvas position relative to viewport
        const touchX = touch.clientX - rect.left;
        const touchY = touch.clientY - rect.top;

        this.ctx.putImageData(this.snapshot, 0, 0);

        if (this.selectedTool === "brush" || this.selectedTool === "eraser") {
            this.ctx.strokeStyle = this.selectedTool === "eraser" ? "#fff" : this.selectedColor;
            this.ctx.lineTo(touchX, touchY);
            this.ctx.stroke();
        }
    }


    drawing = (e) =>{
        if(!this.isDrawing) return;
        this.ctx.putImageData(this.snapshot,0,0);
        this.dropperActive = false;

        if(this.selectedTool === "pencil" || this.selectedTool === "eraser"){
            this.ctx.strokeStyle = this.selectedTool === "eraser" ? "#fff" : this.selectedColor; 
            this.ctx.lineTo(e.offsetX, e.offsetY);
            this.ctx.stroke()
        }else if(this.selectedTool === "square"){
            this.drawRect(e);
        }else if(this.selectedTool === "oval"){
            this.drawEllipse(e.offsetX, e.offsetY);
        }else if(this.selectedTool === "line"){
            this.drawLine(e);
        }
    }

    dropper = (e) => {
        const data = this.ctx.getImageData(e.offsetX, e.offsetY, 1, 1).data;
        const hex = this.rgbToHex(data[0],data[1],data[2])

        this.selectedColor = hex;
        this.color1.style.backgroundColor = hex;
    }

    rgbToHex(r, g, b) {
        return "#" + (1 << 24 | r << 16 | g << 8 | b).toString(16).slice(1);
    }

    drawEllipse = (x2, y2) => {
                // Calculate the center of the ellipse
        const centerX = (this.prevMouseX + x2) / 2;
        const centerY = (this.prevMouseY + y2) / 2;

        // Calculate the width and height (semi-major and semi-minor axes)
        const width = Math.abs(x2 - this.prevMouseX) / 2;
        const height = Math.abs(y2 - this.prevMouseY) / 2;

        // Draw the ellipse
        this.ctx.beginPath();
        this.ctx.ellipse(centerX, centerY, width, height, 0, 0, Math.PI * 2);
        this.ctx.strokeStyle = this.selectedColor;
        this.ctx.stroke();
    }

    drawRect = (e) => {
        this.ctx.strokeRect(e.offsetX,e.offsetY,this.prevMouseX - e.offsetX,this.prevMouseY - e.offsetY);
    }

    drawLine = (e) => {
        this.ctx.beginPath();
        this.ctx.moveTo(this.prevMouseX,this.prevMouseY);
        this.ctx.lineTo(e.offsetX,e.offsetY)
        this.ctx.stroke();
    }

    startDraw = (e) => {
        this.isDrawing = true;
        this.prevMouseX = e.offsetX
        this.prevMouseY = e.offsetY
        this.ctx.beginPath();
        this.ctx.lineWidth = this.brushWidth;
        this.ctx.strokeStyle = this.selectedColor;
        this.ctx.fillStyle = this.selectedColor;
        this.snapshot = this.ctx.getImageData(0,0,this.canvas.width,this.canvas.height)

        if(this.selectedTool === "dropper"){
            this.dropper(e);
        }
    }
}