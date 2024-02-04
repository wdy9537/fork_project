document.ready(function () {
    function hideAndShow(wrapper, button, className) {
        button.on("click", function (e) {
            button.addClass("btn-focus");
            button.children().eq(0).addClass("btn-focused");
            wrapper.show().addClass(className);
            button.find('a').css('color', 'black');
        });

        document.mouseup(function (e) {
            if (!wrapper.has(e.target).length && !(wrapper[0] == e.target)) {
                wrapper.hide().removeClass(className);
                button.removeClass("btn-focus");
                button.children().eq(0).removeClass("btn-focused");
                button.find('a').css('color', '');
            }
        });
    }

    const cart = ".cart-wrap";
    hideAndShow(cart, ".cart-header-wrap", 'emphasized');

    const receipt = ".receipt-wrap";
    hideAndShow(receipt, ".receipt-header-wrap", 'emphasized');
});


// 메뉴수량
'._count :button'.on({
    'click': function (e) {
        e.preventDefault();
        var $count = this.parent('._count').find('.inp');
        var now = parseInt($count.val());
        var min = 1;
        var max = 20;
        var num = now;
        if (this.hasClass('minus')) {
            var type = 'm';
        } else {
            var type = 'p';
        }
        if (type == 'm') {
            if (now > min) {
                num = now - 1;
            }
        } else {
            if (now < max) {
                num = now + 1;
            }
        }
        if (num != now) {
            $count.val(num);
        }
    }
});

//영수증, 장바구니 스크롤
const scrollableDiv = document.getElementsByClassName('scrollable');
        [].forEach.call(scrollableDiv, function(item){
            let isMouseDown = false;
            let startY;
            let startScrollTop;
            
            item.addEventListener('mousedown', (e) => {
                isMouseDown = true;
                startY = e.pageY - item.offsetTop;
                startScrollTop = item.scrollTop;
            });

            item.addEventListener('mouseup', () => {
                isMouseDown = false;
            });

            item.addEventListener('mousemove', (e) => { 
                if (!isMouseDown) return;
                e.preventDefault();

                const newY = e.pageY - item.offsetTop;
                const deltaY = newY - startY;

                item.scrollTop = startScrollTop - deltaY;
            });

            item.addEventListener('mouseleave', () => {
                isMouseDown = false;
            });
        })
