let structure = document.querySelectorAll(".struc");
const container = document.querySelector(".content");

/* 모든 구조물에 드래그 이벤트 추가 */
structure.forEach((moveitem) => {
	moveitem.addEventListener('mousedown', topZIndex);

    const position = moveitem.style.transform;
    
    let positionx = position.substr(12);
    const xend = positionx.indexOf('px');
    positionx = positionx.substr(0, xend);
    
    let ystart = position.indexOf('px, ');
    let positiony = position.substr(ystart+4);
    const yend = positiony.indexOf('px');
    positiony = positiony.substr(0, yend);
    
    dragItem(moveitem, positionx, positiony);
})

/* 구조물 드래그 */
function dragItem(item, x, y){
    let active = false;
    let currentX = x;
    let currentY = y;
    let initialX;
    let initialY;
    let xOffset = 0;
    let yOffset = 0;

    container.addEventListener("touchstart", dragStart, false);
    container.addEventListener("touchend", dragEnd, false);
    container.addEventListener("touchmove", drag, false);

    container.addEventListener("mousedown", dragStart, false);
    container.addEventListener("mouseup", dragEnd, false);
    container.addEventListener("mousemove", drag, false);

    function dragStart(e) {
        
        if ( e.type === "touchstart" ) {
            initialX = e.touches[0].clientX - xOffset;
            initialY = e.touches[0].clientY - yOffset;
        } else {
            initialX = e.clientX - xOffset - currentX;
            initialY = e.clientY - yOffset - currentY;
        }

        if (e.target === item) {
                active = true;
        }
    }

    function dragEnd(e) {
        initialX = currentX;
        initialY = currentY;

        active = false;
    }

    function drag(e) {
        if (active) {
            e.preventDefault();

            if (e.type === "touchmove") {
                currentX = e.touches[0].clientX - initialX;
                currentY = e.touches[0].clientY - initialY;
            } else {
                currentX = e.clientX - initialX;
                currentY = e.clientY - initialY;
            }

            setTranslate(currentX, currentY, item);
        }
    }

    function setTranslate(xPos, yPos, el) {
        el.style.transform = "translate3d(" + xPos + "px, " + yPos + "px, 0)";
    }

}

/* 구조물 삭제 */
function delItem(ex){ ex.parentNode.remove(); }

/* 구조물 추가 */
function addItem(name){
    let addDiv = document.createElement('div');
    addDiv.style.zIndex = 1;
    addDiv.className = 'struc struc_'+name+'_setting';
    addDiv.setAttribute('draggable', 'true');
    addDiv.innerHTML = `<div class="struc_del" onclick='delItem(this);'>X</div>`;   
    
    if ( name == "table" ) {
        addDiv.innerHTML += `<input type="hidden" id="struc_type" value="테이블">
                            <input type="text" name="struc_name" value="테이블" size="10" id="struc_name"/> <br>
                            <span class="struc_title">기계번호</span> <input type="text" name="kiosk_no" value="0" size="2" id="kiosk_no" />`;
    }

    if ( name == "pos" ) {
    	const checkDiv = document.querySelectorAll("#struc_type");
    	for (i in checkDiv) {
    		if ( checkDiv[i].defaultValue == "계산대" ) {
    			alert("이미 계산대가 추가되어있습니다");
    			return;
    		} 
    	}
    	addDiv.innerHTML += `<input type="hidden" id="struc_type" value="계산대">
            	             <input type="text" name="struc_name" value="계산대" size="10" id="struc_name"/> <br>`;
    }

    if ( name == "structure" ) {
        addDiv.className = 'struc struc_structure';
        addDiv.innerHTML += `<input type="hidden" id="struc_type" value="구조물">
        					<input type="text" name="struc_name" value="구조물" size="10" id="struc_name"/> <br>`;
    }
    
    container.append(addDiv);
    dragItem(addDiv,0,0);
}

/* 구조물 클릭시 제일 상단으로 올리기 */
function topZIndex(){
	const arr = [];
	let max;

	structure.forEach((struc) => {
		arr.push(Number(struc.style.zIndex))
		
		max = arr.reduce(function(a,b){
			return Math.max(a,b);
		})
	})
	
	this.style.zIndex = max+1;
}

function maxZIndex(){
	let maxZ;
	
	structure.forEach((struc) => {
		if ( Number(struc.style.zIndex) > maxZ ) {
			maxZ = Number(struc.style.zIndex) + 1;
		}
	})
	
}

                        