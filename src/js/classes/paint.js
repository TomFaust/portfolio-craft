export class Paint{

    canvas;
    ctx;
    snapshot;
    isDrawing = false;
    selectedTool = "pencil";
    brushWidth = 1;
    eraserWidth = 3;
    selectedColor = "#000";
    colorBtns = document.querySelectorAll("#colors .color")
    toolBtns; 
    color1;

    endMouseX = null;
    endMouseY = null;

    prevMouseX; 
    prevMouseY; 

    lastX;
    lastY;

    startMouseX = null;
    startMouseY = null;

     constructor(div){
        this.canvas = div.querySelector('canvas');
        this.color1 = div.querySelector('#color1');

        this.canvas.width = this.canvas.offsetWidth
        this.canvas.height = this.canvas.offsetHeight
        
        this.ctx = this.canvas.getContext("2d", { willReadFrequently: true })

        this.canvas.addEventListener("mousedown",this.startDraw)
        this.canvas.addEventListener("mousemove",this.drawing)
        this.canvas.addEventListener("mouseup", this.stopDraw)

        this.canvas.addEventListener("touchstart",(e) => {this.startDraw(e,true)})
        this.canvas.addEventListener("touchmove",(e) => {this.drawing(e,true)})
        this.canvas.addEventListener("touchend", (e) => {this.stopDraw(e,true)})

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

                    if(this.selectedTool == "shape"){
                        this.finishShape();
                    }

                    div.querySelector('#tool-grid .tool.active').classList.remove("active");
                    tool.classList.add("active")
                    this.selectedTool = tool.id

                    this.startMouseX = null;
                    this.startMouseY = null
                    this.endMouseX = null;
                    this.endMouseY = null;

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
            x = Math.round(touch.clientX - rect.left);
            y = Math.round(touch.clientY - rect.top);
        }

        this.lastX = x;
        this.lastY = y;

        this.ctx.putImageData(this.snapshot,0,0);

        switch(this.selectedTool){
            case "pencil":
            case "eraser":
                this.ctx.strokeStyle = this.selectedTool === "eraser" ? "#fff" : this.selectedColor; 
                this.ctx.lineTo(x,y);
                this.ctx.stroke()
                break;
            case "square":
                this.drawRect(x,y);
                break;
            case "oval":
                this.drawEllipse(x,y);
                break;
            case "line":
                this.drawLine(x,y);
                break;
            case "rounded":
                this.drawRoundedRect(x,y)
                break;
            case "shape":
                this.drawShape(x,y)
                break;
            case "bucket":
                this.fill(x,y,this.selectedColor);
                break;
        }
    }

    drawShape = (offsetX,offsetY) =>{
   
        this.ctx.beginPath();

        if(this.endMouseX && this.endMouseY){
            this.ctx.moveTo(this.endMouseX,this.endMouseY);
        }else{
            this.ctx.moveTo(this.prevMouseX,this.prevMouseY);
        }

        this.ctx.lineTo(offsetX,offsetY)
        this.ctx.stroke();
    }

    finishShape = () =>{
        this.ctx.beginPath();
        this.ctx.moveTo(this.endMouseX,this.endMouseY);
        this.ctx.lineTo(this.startMouseX,this.startMouseY);
        this.ctx.stroke();
    }

    dropper = (offsetX,offsetY) => {
        const data = this.ctx.getImageData(offsetX,offsetY, 1, 1).data;
        const hex = this.rgbToHex(data[0],data[1],data[2])

        this.selectedColor = hex;
        this.color1.style.backgroundColor = hex;
    }

    rgbToHex(r, g, b) {
        return "#" + (1 << 24 | r << 16 | g << 8 | b).toString(16).slice(1);
    }

    drawEllipse = (offsetX,offsetY) => {
      
        const centerX = (this.prevMouseX + offsetX) / 2;
        const centerY = (this.prevMouseY + offsetY) / 2;

        const width = Math.abs(offsetX - this.prevMouseX) / 2;
        const height = Math.abs(offsetY - this.prevMouseY) / 2;

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

    drawRoundedRect = (offsetX, offsetY) => {
        const x = Math.min(this.prevMouseX, offsetX);
        const y = Math.min(this.prevMouseY, offsetY);
        const width = Math.abs(offsetX - this.prevMouseX);
        const height = Math.abs(offsetY - this.prevMouseY);

        const radius = Math.min(20, width / 2, height / 2); // adjust 20 as needed

        this.ctx.beginPath();
        this.ctx.moveTo(x + radius, y);

        this.ctx.lineTo(x + width - radius, y);
        this.ctx.quadraticCurveTo(x + width, y, x + width, y + radius);

        this.ctx.lineTo(x + width, y + height - radius);
        this.ctx.quadraticCurveTo(x + width, y + height, x + width - radius, y + height);

        this.ctx.lineTo(x + radius, y + height);
        this.ctx.quadraticCurveTo(x, y + height, x, y + height - radius);

        this.ctx.lineTo(x, y + radius);
        this.ctx.quadraticCurveTo(x, y, x + radius, y);

        this.ctx.closePath();

        this.ctx.strokeStyle = this.selectedColor;
        this.ctx.stroke();
    }

    fill = (startX, startY, fillColor) => {

        const canvasWidth = this.canvas.width;
        const canvasHeight = this.canvas.height;

        const imageData = this.ctx.getImageData(0, 0, canvasWidth, canvasHeight);
        const data = imageData.data;

        const getIndex = (x, y) => (y * canvasWidth + x) * 4;

        const startIndex = getIndex(startX, startY);
        const targetColor = data.slice(startIndex, startIndex + 4);

        const colorsMatch = (i, color) => {
            return (
                data[i] === color[0] &&
                data[i + 1] === color[1] &&
                data[i + 2] === color[2]
            );
        };

        const setColor = (i, color) => {
            data[i] = color[0];
            data[i + 1] = color[1];
            data[i + 2] = color[2];
        };

        const newColor = this.normalizeColor(fillColor);
        
        // Prevent infinite loop if same color
        if (
            targetColor[0] === newColor[0] &&
            targetColor[1] === newColor[1] &&
            targetColor[2] === newColor[2] 
        ) return;

        const stack = [[startX, startY]];

        while (stack.length) {
            const [x, y] = stack.pop();
            const i = getIndex(x, y);

            if (!colorsMatch(i, targetColor)) continue;

            setColor(i, newColor);

            // Push neighbors
            if (x > 0) stack.push([x - 1, y]);
            if (x < canvasWidth - 1) stack.push([x + 1, y]);
            if (y > 0) stack.push([x, y - 1]);
            if (y < canvasHeight - 1) stack.push([x, y + 1]);
        }

        this.ctx.putImageData(imageData, 0, 0);
    };

    stopDraw = (e,touch = false) =>{
        this.endMouseX = e.offsetX
        this.endMouseY = e.offsetY 

        if(touch){
            this.endMouseX = this.lastX;
            this.endMouseY = this.lastY;
        }

        this.isDrawing = false 
    }

    startDraw = (e,touch = false) => {
        let x = e.offsetX;
        let y = e.offsetY;

        if(touch){
            e.preventDefault();
            const touch = e.touches[0];
            const rect = this.canvas.getBoundingClientRect();
            x = Math.round(touch.clientX - rect.left);
            y = Math.round(touch.clientY - rect.top);
        }

        if(!this.startMouseX && !this.startMouseY){
            this.startMouseX = x;
            this.startMouseY = y;
        }

        this.isDrawing = true;
        this.prevMouseX = x
        this.prevMouseY = y
        this.ctx.beginPath();
        if(this.selectedTool === "eraser"){
            this.ctx.lineWidth = this.eraserWidth;
        }else{
            this.ctx.lineWidth = this.brushWidth;
        }
        this.ctx.strokeStyle = this.selectedColor;
        this.ctx.fillStyle = this.selectedColor;
        this.snapshot = this.ctx.getImageData(0,0,this.canvas.width,this.canvas.height)

        if(this.selectedTool === "dropper"){
            this.dropper(x,y);
        }else if (this.selectedTool === "bucket"){
            this.fill(x,y,this.selectedColor);
        }
    }

    normalizeColor(color) {
        // If it's in the form of rgb or rgba
        if (color.startsWith('rgb')) {
            const match = color.match(/\d+/g);
            return match ? match.slice(0, 3).map(Number) : null;
        }

        // If it's in the form of a hex code
        if (color.startsWith('#')) {
            let hex = color.substring(1);
            if (hex.length === 3) {
                hex = hex.split('').map(h => h + h).join('');
            }
            const r = parseInt(hex.substring(0, 2), 16);
            const g = parseInt(hex.substring(2, 4), 16);
            const b = parseInt(hex.substring(4, 6), 16);
            return [r, g, b];
        }

        // If it's a named color
        const namedColors = {
            "black": [0, 0, 0],
            "white": [255, 255, 255],
            "red": [255, 0, 0],
            "green": [0, 255, 0],
            "blue": [0, 0, 255],
            "yellow": [255, 255, 0],
            "cyan": [0, 255, 255],
            "magenta": [255, 0, 255]
            // Add other named colors if needed
        };

        return namedColors[color.toLowerCase()] || null;  // Return null if not found
    }

    saveImg = () =>{
        const link = document.createElement("a")
        link.download = `${Date.now()}.jpg`;
        link.href = this.canvas.toDataURL();
        link.click();
    }
}