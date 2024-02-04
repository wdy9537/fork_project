<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%= request.getContextPath() %>"/>
<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>회원가입 동의서</title>
<link href='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css' rel='stylesheet'>
<link href='https://use.fontawesome.com/releases/v5.7.2/css/all.css' rel='stylesheet'>
<link rel="stylesheet" href="../resources/css/member/enrollPage2.css">
<script type='text/javascript' src='https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js'></script>
<script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js'></script>
</head>
<body oncontextmenu='return false' class='snippet-body'>
	
	<c:if test="${not empty alertMsg }">
		<script>
			alert('${alertMsg}');
		</script>
		<c:remove var="alertMsg"/>
	</c:if>

    <div class="wrapper bg-white">
        <div class="h2 text-center">회원가입 동의서</div>
        <form class="pt-3" action="${contextPath }/member/enrollForm2">
            <div class="form-group">
                <input type="checkbox" class="btn" required><label>이용약관 동의</label><span class="essential"> (필수)</span>
                <textarea readonly>
 제1장총칙 
 제1조(목적)
 이약관은 FORK 에서제공하는인터넷서비스(이하"서비스"라합니다)의이용조건및절차에관한기본적인사항을규정함을목적으로합니다.
 제2조(약관의효력및변경)
 ①이약관은서비스화면이나기타의방법으로이용고객에게공지함으로써효력을발생합니다.
 ②사이트는이약관의내용을변경할수있으며,변경된약관은제1항과같은방법으로공지또는통지함으로써효력을발생합니다.
 제3조(용어의정의)
 이약관에서사용하는용어의정의는다음과같습니다.
 ①회원:사이트와서비스이용계약을체결하거나이용자아이디(ID)를부여받은개인또는단체를말합니다.
 ②신청자:회원가입을신청하는개인또는단체를말합니다.
 ③아이디(ID):회원의식별과서비스이용을위하여회원이정하고사이트가승인하는문자와숫자의조합을말합니다.
 ④비밀번호:회원이부여받은아이디(ID)와일치된회원임을확인하고,회원자신의비밀을보호하기위하여회원이정한문자와숫자의조합을말합니다.
 ⑤해지:사이트또는회원이서비스이용계약을취소하는것을말합니다.
 제2장서비스이용계약
 제4조(이용계약의성립)
 ①이용약관하단의동의버튼을누르면이약관에동의하는것으로간주됩니다.
 ②이용계약은서비스이용희망자의이용약관동의후이용신청에대하여사이트가승낙함으로써성립합니다.
 제5조(이용신청)
 ①신청자가본서비스를이용하기위해서는사이트소정의가입신청양식에서요구하는이용자정보를기록하여제출해야합니다.
 ②가입신청양식에기재하는모든이용자정보는모두실제데이터인것으로간주됩니다.실명이나실제정보를입력하지않은사용자는법적인보호를받을수없으며,서비스의제한을받을수있습니다.
 제6조(이용신청의승낙)
 ①사이트는신청자에대하여제2항,제3항의경우를예외로하여서비스이용신청을승낙합니다.
 ②사이트는다음에해당하는경우에그신청에대한승낙제한사유가해소될때까지승낙을유보할수있습니다.
 가.서비스관련설비에여유가없는경우 나.기술상지장이있는경우
 다.기타사이트가필요하다고인정되는경우 ③사이트는신청자가다음에해당하는경우에는승낙을거부할수있습니다.
 가.다른개인(사이트)의명의를사용하여신청한경우 나.이용자정보를허위로기재하여신청한경우 다.사회의안녕질서또는미풍양속을저해할목적으로신청한경우 라.기타사이트소정의이용신청요건을충족하지못하는경우 제7조(이용자정보의변경)
 회원은이용신청시에기재했던회원정보가변경되었을경우에는,온라인으로수정하여야하며변경하지않음으로인하여발생되는모든문제의책임은회원에게있습니다.
 제3장계약당사자의의무
 제8조(사이트의의무)
 ①사이트는회원에게각호의서비스를제공합니다.
 가.신규서비스와도메인정보에대한뉴스레터발송 나.추가도메인등록시개인정보자동입력 다.도메인등록,관리를위한각종부가서비스 ②사이트는서비스제공과관련하여취득한회원의개인정보를회원의동의없이타인에게누설,공개또는배포할수없으며,서비스관련업무이외의상업적목적으로사용할수없습니다.단,다음각호의1에해당하는경우는예외입니다.
 가.전기통신기본법등법률의규정에의해국가기관의요구가있는경우 나.범죄에대한수사상의목적이있거나정보통신윤리위원회의요청이있는경우 다.기타관계법령에서정한절차에따른요청이있는경우 ③사이트는이약관에서정한바에따라지속적,안정적으로서비스를제공할의무가있습니다.
 제9조(회원의의무)
 ①회원은서비스이용시다음각호의행위를하지않아야합니다.
 가.다른회원의ID를부정하게사용하는행위 나.서비스에서얻은정보를사이트의사전승낙없이회원의이용이외의목적으로복제하거나이를변경,출판및방송등에사용하거나타인에게제공하는행위 다.사이트의저작권,타인의저작권등기타권리를침해하는행위 라.공공질서및미풍양속에위반되는내용의정보,문장,도형등을타인에게유포하는행위 마.범죄와결부된다고객관적으로판단되는행위 바.기타관계법령에위배되는행위
 ②회원은관계법령,이약관에서규정하는사항,서비스이용안내및주의사항을준수하여야합니다.
 ③회원은내용별로사이트가서비스공지사항에게시하거나별도로공지한이용제한사항을준수하여야합니다.
 제4장서비스제공및이용
 제10조(회원아이디(ID)와비밀번호관리에대한회원의의무) ①아이디(ID)와비밀번호에대한모든관리는회원에게책임이있습니다.회원에게부여된아이디(ID)와비밀번호의관리소홀,부정사용에의하여발생하는모든결과에대한전적인책임은회원에게있습니다.
 ②자신의아이디(ID)가부정하게사용된경우또는기타보안위반에대하여,회원은반드시사이트에그사실을통보해야합니다.
 제11조(서비스제한및정지)
 ①사이트는전시,사변,천재지변또는이에준하는국가비상사태가발생하거나발생할우려가있는경우와전기통신사업법에의한기간통신사업자가전기통신서비스를중지하는등기타불가항력적사유가있는경우에는서비스의전부또는일부를제한하거나정지할수있습니다.
 ②사이트는제1항의규정에의하여서비스의이용을제한하거나정지할때에는그사유및제한기간등을지체없이회원에게알려야합니다.
 제5장계약사항의변경,해지
 제12조(정보의변경)
 회원이주소,비밀번호등고객정보를변경하고자하는경우에는홈페이지의회원정보변경서비스를이용하여변경할수있습니다.
 제13조(계약사항의해지)
 회원은서비스이용계약을해지할수있으며,해지할경우에는본인이직접서비스를통하거나전화또는온라인등으로사이트에해지신청을하여야합니다.사이트는해지신청이접수된당일부터해당회원의서비스이용을제한합니다.사이트는회원이다음각항의1에해당하여이용계약을해지하고자할경우에는해지조치7일전까지그뜻을이용고객에게통지하여소명할기회를주어야합니다.
 ①이용고객이이용제한규정을위반하거나그이용제한기간내에제한사유를해소하지않는경우 ②정보통신윤리위원회가이용해지를요구한경우 ③이용고객이정당한사유없이의견진술에응하지아니한경우 ④타인명의로신청을하였거나신청서내용의허위기재또는허위서류를첨부하여이용계약을체결한경우 사이트는상기규정에의하여해지된이용고객에대해서는별도로정한기간동안가입을제한할수있습니다.
 제6장손해배상
 제14조(면책조항)
 ①사이트는회원이서비스제공으로부터기대되는이익을얻지못하였거나서비스자료에대한취사선택또는이용으로발생하는손해등에대해서는책임이면제됩니다.
 ②사이트는회원의귀책사유나제3자의고의로인하여서비스에장애가발생하거나회원의데이터가훼손된경우에책임이면제됩니다.
 ③사이트는회원이게시또는전송한자료의내용에대해서는책임이면제됩니다.
 ④상표권이있는도메인의경우,이로인해발생할수도있는손해나배상에대한책임은구매한회원당사자에게있으며,사이트는이에대한일체의책임을지지않습니다.
 제15조(관할법원)
 서비스와관련하여사이트와회원간에분쟁이발생할경우사이트의본사소재지를관할하는법원을관할법원으로합니다.
 [부칙]
 (시행일)이약관은2015년01월부터시행합니다.
                </textarea>
            </div>
            <div class="form-group">
                <input type="checkbox" class="btn" required><label>개인정보 수집 및 이용</label><span class="essential"> (필수)</span>
                <textarea readonly>
본인은 귀사에 이력서를 제출함에 따라 [개인정보 보호법] 제15조 및 제17조에 따라 아래의 내용으로 개인정보를 수집, 이용 및 제공하는데 동의합니다.
 □ 개인정보의 수집 및 이용에 관한 사항 - 수집하는 개인정보 항목 (이력서 양식 내용 일체) : 성명, 주민등록번호, 전화번호, 주소, 이메일, 가족관계, 학력사항, 경력사항, 자격사항 등과 그 외 이력서 기재 내용 일체
 - 개인정보의 이용 목적 : 수집된 개인정보를 사업장 신규 채용 서류 심사 및 인사서 류로 활용하며, 목적 외의 용도로는 사용하지 않습니다.
 □ 개인정보의 보관 및 이용 기간
 - 귀하의 개인정보를 다음과 같이 보관하며, 수집, 이용 및 제공목적이 달성된 경우 [개인정보 보호법] 제21조에 따라 처리합니다.
                </textarea>
            </div>
            <div class="form-group">
                <input type="checkbox" class="btn" required><label>개인정보 제3자 제공 동의</label><span class="essential"> (필수)</span>
                <textarea readonly>
FORK는 개인정보보호법 등 관련 법령상의 개인정보 보호 규정을 준수하며 학생의 개인정보 보호에 최선을 다하고 있습니다.  FORK는  개인정보보호법 제15조 및 같은 법 제22조에 근거하여, 다음과 같이 수집 및 이용을(를) 위하여 개인정보를 수집․이용하는데 동의를 받고자 합니다. 
                </textarea>
            </div>
            <div class="form-group">
                <input type="checkbox" class="btn btn-all"><label>모두 동의합니다.</label>
            </div>
            <div class="nextpage">
                <button type="submit">다음 페이지</button>
            </div>
        </form>
    </div>
    <script>
    	
 	// HTML에서 각 체크박스와 라벨 또는 스팬 요소를 가져옵니다.
    var termsCheckbox = document.querySelector('.btn[required] + label'); // 이용약관 동의 체크박스와 라벨
    var privacyCheckbox = document.querySelectorAll('.btn[required] + label')[1]; // 개인정보 수집 및 이용 동의 체크박스와 라벨
    var thirdPartyCheckbox = document.querySelectorAll('.btn[required] + label')[2]; // 개인정보 제3자 제공 동의 체크박스와 라벨

    // 각 라벨 또는 스팬을 클릭했을 때 해당 체크박스를 체크하도록 이벤트 리스너를 추가합니다.
    termsCheckbox.addEventListener('click', function () {
        var checkbox = this.previousElementSibling; // 체크박스 엘리먼트를 가져옵니다.
        checkbox.checked = !checkbox.checked; // 체크 상태를 변경합니다.
    });

    privacyCheckbox.addEventListener('click', function () {
        var checkbox = this.previousElementSibling; // 체크박스 엘리먼트를 가져옵니다.
        checkbox.checked = !checkbox.checked; // 체크 상태를 변경합니다.
    });

    thirdPartyCheckbox.addEventListener('click', function () {
        var checkbox = this.previousElementSibling; // 체크박스 엘리먼트를 가져옵니다.
        checkbox.checked = !checkbox.checked; // 체크 상태를 변경합니다.
    });
    
    /* ======================================================= */
    
    
    // "모두 동의합니다" 체크박스와 그 라벨 요소, 필수 체크박스 요소들을 가져옵니다.
    var masterCheckbox = document.querySelector('.btn.btn-all');
    var masterLabel = document.querySelector('.btn.btn-all + label');
    var requiredCheckboxes = document.querySelectorAll('.btn[required]');

    // "모두 동의합니다" 체크박스를 클릭했을 때 실행되는 함수
    masterCheckbox.addEventListener('click', function () {
        // "모두 동의합니다" 체크박스의 상태를 가져옵니다.
        var isChecked = masterCheckbox.checked;

        // 모든 필수 체크박스의 상태를 모두 동일하게 설정합니다.
        for (var i = 0; i < requiredCheckboxes.length; i++) {
            requiredCheckboxes[i].checked = isChecked;
        }
    });

    // "모두 동의합니다" 체크박스의 라벨(label)를 클릭했을 때 "모두 동의합니다" 체크박스의 상태를 변경합니다.
    masterLabel.addEventListener('click', function () {
        masterCheckbox.checked = !masterCheckbox.checked;

        // "모두 동의합니다" 체크박스의 상태가 변경되면 필수 체크박스들의 상태도 변경합니다.
        for (var i = 0; i < requiredCheckboxes.length; i++) {
            requiredCheckboxes[i].checked = masterCheckbox.checked;
        }
    });

    // 필수 체크박스 중 하나라도 체크가 해제되면 "모두 동의합니다" 체크박스도 체크 해제
    for (var i = 0; i < requiredCheckboxes.length; i++) {
        requiredCheckboxes[i].addEventListener('click', function () {
            // 필수 체크박스 중 하나라도 체크 해제된 경우
            if (!this.checked) {
                masterCheckbox.checked = false;
            } else {
                // 모든 필수 체크박스가 선택되었을 때 "모두 동의합니다" 체크박스도 체크
                var allChecked = true;
                for (var j = 0; j < requiredCheckboxes.length; j++) {
                    if (!requiredCheckboxes[j].checked) {
                        allChecked = false;
                        break;
                    }
                }
                if (allChecked) {
                    masterCheckbox.checked = true;
                }
            }
        });
    }

	</script>


</body>

</html>