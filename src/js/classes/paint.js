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
    }

    setCanvasBackground = () => {
        this.ctx.fillStyle = "#fff";
        this.ctx.fillRect(0,0,this.canvas.width,this.canvas.height);
        this.ctx.fillStyle = this.selectedColor;
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

        if(this.selectedTool === "brush" || selectedTool === "eraser"){
            this.ctx.strokeStyle = this.selectedTool === "eraser" ? "#fff" : this.selectedColor; 
            this.ctx.lineTo(e.offsetX, e.offsetY);
            this.ctx.stroke()
        }else if(this.selectedTool === "rectangle"){
            //drawRect(e);
        }else if(this.selectedTool === "circle"){
            //drawCircle(e);
        }else if(this.selectedTool === "triangle"){
            //drawTriangle(e);
        }
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
    }
}