<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Global Times</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/css/menubar.css">

<script type="text/javascript">


const hour = document.getElementById('clock-hour'),
      minutes = document.getElementById('clock-minutes'),
      seconds = document.getElementById('clock-seconds')

const clock = () =>{
    let date = new Date()

    let hh = date.getHours() * 30,
        mm = date.getMinutes() * 6,
        ss = date.getSeconds() * 6
        

    hour.style.transform = `rotateZ(${hh + mm / 12}deg)`
    minutes.style.transform = `rotateZ(${mm}deg)`
    seconds.style.transform = `rotateZ(${ss}deg)`
}
setInterval(clock, 1000) // 1000 = 1s


const textHour = document.getElementById('text-hour'),
      textMinutes = document.getElementById('text-minutes'),
      textAmPm = document.getElementById('text-ampm'),
      dateDay = document.getElementById('date-day'),
      dateMonth = document.getElementById('date-month'),
      dateYear = document.getElementById('date-year')

const clockText = () =>{
    let date = new Date()

    let hh = date.getHours(),
        ampm,
        mm = date.getMinutes(),
        day = date.getDate(),
        month = date.getMonth(),
        year = date.getFullYear()

  
    if(hh >= 12){
        hh = hh - 12
        ampm = 'PM'
    }else{
        ampm = 'AM'
    }

    if(hh == 0){hh = 12}

 
    if(hh < 10){hh = `0${hh}`}

   
    textHour.innerHTML = `${hh}:`
    
 
    if(mm < 10){mm = `0${mm}`}
    

    textMinutes.innerHTML = mm


    textAmPm.innerHTML = ampm

    let months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
  
    dateDay.innerHTML = day
    dateMonth.innerHTML = `${months[month]},`
    dateYear.innerHTML = year
}
setInterval(clockText, 1000) // 1000 = 1s





</script>

</head>

<body>
	<!-- 해더 메인로고 -->
	<header class="header_container">
		<h1 class="header_h1">
			<img class="main_logo" src="${pageContext.request.contextPath}/resources/member/세미로고.png" alt="main_logo"
				onclick="location.href='#'">
		</h1>
		<span class="r_posi">
			<ul class="r_info">
				<li class="r_li"><a href="#" class="r__button">회원가입</a></li>
				<li class="r_li"><a href="#" class="r__button">로그인</a></li>
				<li class="r_li"><a href="#" class="r__button">신문구독</a></li>
			</ul>
		</span>
	</header>

	<!-- 세계시간 -->
<div style="height: 250px;">	
	<section class="clock_container">
		<div class="clock__container grid">
			<div class="clock__content grid">
				<div class="clock">
					<div class="clock__circle">
						<span class="clock__twelve"></span> <span class="clock__three"></span>
						<span class="clock__six"></span> <span class="clock__nine"></span>

						<div class="clock__rounder"></div>
						<div class="clock__hour" id="clock-hour"></div>
						<div class="clock__minutes" id="clock-minutes"></div>
						<div class="clock__seconds" id="clock-seconds"></div>
					</div>

					<div class="clock_text">
						<div class="clock__text">
							<div class="clock__text-hour" id="text-hour"></div>
							<div class="clock__text-minutes" id="text-minutes"></div>
							<div class="clock__text-ampm" id="text-ampm"></div>
						</div>

						<div class="clock__date">

							<span id="date-day"></span> <span id="date-month"></span> <span
								id="date-year"></span>
						</div>
					</div>
				</div>

				<div class="clock">
					<div class="clock__circle">
						<span class="clock__twelve"></span> <span class="clock__three"></span>
						<span class="clock__six"></span> <span class="clock__nine"></span>

						<div class="clock__rounder"></div>
						<div class="clock__hour" id="clock-hour"></div>
						<div class="clock__minutes" id="clock-minutes"></div>
						<div class="clock__seconds" id="clock-seconds"></div>
					</div>

					<div class="clock_text">
						<div class="clock__text">
							<div class="clock__text-hour" id="text-hour"></div>
							<div class="clock__text-minutes" id="text-minutes"></div>
							<div class="clock__text-ampm" id="text-ampm"></div>
						</div>

						<div class="clock__date">
							<!-- <span id="date-day-week"></span> -->
							<span id="date-day"></span> <span id="date-month"></span> <span
								id="date-year"></span>
						</div>
					</div>
				</div>

				<div class="clock">
					<div class="clock__circle">
						<span class="clock__twelve"></span> <span class="clock__three"></span>
						<span class="clock__six"></span> <span class="clock__nine"></span>

						<div class="clock__rounder"></div>
						<div class="clock__hour" id="clock-hour"></div>
						<div class="clock__minutes" id="clock-minutes"></div>
						<div class="clock__seconds" id="clock-seconds"></div>
					</div>

					<div class="clock_text">
						<div class="clock__text">
							<div class="clock__text-hour" id="text-hour"></div>
							<div class="clock__text-minutes" id="text-minutes"></div>
							<div class="clock__text-ampm" id="text-ampm"></div>
						</div>

						<div class="clock__date">

							<span id="date-day"></span> <span id="date-month"></span> <span
								id="date-year"></span>
						</div>
					</div>
				</div>

				<div class="clock">
					<div class="clock__circle">
						<span class="clock__twelve"></span> <span class="clock__three"></span>
						<span class="clock__six"></span> <span class="clock__nine"></span>

						<div class="clock__rounder"></div>
						<div class="clock__hour" id="clock-hour"></div>
						<div class="clock__minutes" id="clock-minutes"></div>
						<div class="clock__seconds" id="clock-seconds"></div>
					</div>

					<div class="clock_text">
						<div class="clock__text">
							<div class="clock__text-hour" id="text-hour"></div>
							<div class="clock__text-minutes" id="text-minutes"></div>
							<div class="clock__text-ampm" id="text-ampm"></div>
						</div>

						<div class="clock__date">

							<span id="date-day"></span> <span id="date-month"></span> <span
								id="date-year"></span>
						</div>
					</div>
				</div>

				<div class="clock">
					<div class="clock__circle">
						<span class="clock__twelve"></span> <span class="clock__three"></span>
						<span class="clock__six"></span> <span class="clock__nine"></span>

						<div class="clock__rounder"></div>
						<div class="clock__hour" id="clock-hour"></div>
						<div class="clock__minutes" id="clock-minutes"></div>
						<div class="clock__seconds" id="clock-seconds"></div>
					</div>

					<div class="clock_text">
						<div class="clock__text">
							<div class="clock__text-hour" id="text-hour"></div>
							<div class="clock__text-minutes" id="text-minutes"></div>
							<div class="clock__text-ampm" id="text-ampm"></div>
						</div>

						<div class="clock__date">

							<span id="date-day"></span> <span id="date-month"></span> <span
								id="date-year"></span>
						</div>
					</div>
				</div>

				<div class="clock">
					<div class="clock__circle">
						<span class="clock__twelve"></span> <span class="clock__three"></span>
						<span class="clock__six"></span> <span class="clock__nine"></span>

						<div class="clock__rounder"></div>
						<div class="clock__hour" id="clock-hour"></div>
						<div class="clock__minutes" id="clock-minutes"></div>
						<div class="clock__seconds" id="clock-seconds"></div>
					</div>

					<div class="clock_text">
						<div class="clock__text">
							<div class="clock__text-hour" id="text-hour"></div>
							<div class="clock__text-minutes" id="text-minutes"></div>
							<div class="clock__text-ampm" id="text-ampm"></div>
						</div>

						<div class="clock__date">

							<span id="date-day"></span> <span id="date-month"></span> <span
								id="date-year"></span>
						</div>
					</div>
				</div>

			</div>
	</section>
</div>

	<!-- 네비바 -->
	<div class="nav_wrapper">
		<nav class="nav_container">
			<ul class="nav_ul_form">
				<!-- TODO : 카테고리 포이치 설정필요 -->
				<li class="dropdown"><a href="#" class="nav_title">정치</a></li>
				<li class="dropdown"><a href="#" class="nav_title">연예</a></li>
				<li class="dropdown"><a href="#" class="nav_title">스포츠</a></li>
				<li class="dropdown"><a href="#" class="nav_title">공란</a>
				<li class="dropdown"><a href="#" class="nav_title">공란</a>
				<li class="dropdown"><a href="#" class="nav_title">공란</a>
			</ul>
		</nav>

	</div>

</body>
</html>
