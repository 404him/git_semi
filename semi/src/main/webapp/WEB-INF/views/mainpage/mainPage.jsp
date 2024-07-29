<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Global Times</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/main.css">

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
        <h1 class="header_h1"><img class="main_logo" src="logo.png" alt="main_logo" onclick="location.href='#'"></h1>
            <span class="r_posi">
            <ul class="r_info">
                <li class="r_li"><a href="#" class="r__button">회원가입</a></li>
                <li class="r_li"><a href="#" class="r__button">로그인</a></li>
                <li class="r_li"><a href="#" class="r__button">신문구독</a></li>
            </ul>
            </span>
    </header>

        <!-- 세계시간 -->
        <section class="clock_container">
            <div class="clock__container grid">
                <div class="clock__content grid">
                    <div class="clock">
                        <div class="clock__circle">
                            <span class="clock__twelve"></span>
                            <span class="clock__three"></span>
                            <span class="clock__six"></span>
                            <span class="clock__nine"></span>
        
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
                                
                                <span id="date-day"></span>
                                <span id="date-month"></span>
                                <span id="date-year"></span>
                            </div>
                        </div>
                    </div>

                    <div class="clock">
                        <div class="clock__circle">
                            <span class="clock__twelve"></span>
                            <span class="clock__three"></span>
                            <span class="clock__six"></span>
                            <span class="clock__nine"></span>
        
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
                                <span id="date-day"></span>
                                <span id="date-month"></span>
                                <span id="date-year"></span>
                            </div>
                        </div>
                    </div>

                    <div class="clock">
                        <div class="clock__circle">
                            <span class="clock__twelve"></span>
                            <span class="clock__three"></span>
                            <span class="clock__six"></span>
                            <span class="clock__nine"></span>
        
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
                                
                                <span id="date-day"></span>
                                <span id="date-month"></span>
                                <span id="date-year"></span>
                            </div>
                        </div>
                    </div>

                    <div class="clock">
                        <div class="clock__circle">
                            <span class="clock__twelve"></span>
                            <span class="clock__three"></span>
                            <span class="clock__six"></span>
                            <span class="clock__nine"></span>
        
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
                                
                                <span id="date-day"></span>
                                <span id="date-month"></span>
                                <span id="date-year"></span>
                            </div>
                        </div>
                    </div>

                    <div class="clock">
                        <div class="clock__circle">
                            <span class="clock__twelve"></span>
                            <span class="clock__three"></span>
                            <span class="clock__six"></span>
                            <span class="clock__nine"></span>
        
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
                                
                                <span id="date-day"></span>
                                <span id="date-month"></span>
                                <span id="date-year"></span>
                            </div>
                        </div>
                    </div>

                    <div class="clock">
                        <div class="clock__circle">
                            <span class="clock__twelve"></span>
                            <span class="clock__three"></span>
                            <span class="clock__six"></span>
                            <span class="clock__nine"></span>
        
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
                                
                                <span id="date-day"></span>
                                <span id="date-month"></span>
                                <span id="date-year"></span>
                            </div>
                        </div>
                    </div>
                    
                </div>     
        </section>


        <!-- 네비바 -->
    <div></div>
    <div class="nav_wrapper">
        <nav class="nav_container">
            <ul class="nav_ul_form">
                <li class="dropdown"><a href="#" class="nav_title">정치</a>
                    <ul class="menu-area">
                        <ul class="nav_ul">
                            <h4 class="sub_title">정치</h4>
                            <li class="nav_li"><a href="#" class="nav_a">대통령</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">국회</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">북한</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">국방●외교</a></li>
                        </ul>
                        <ul class="nav_ul"> 
                            <h4 class="sub_title">사회</h4>
                            <li class="nav_li"><a href="#" class="nav_a">사건●사고</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">법원●검찰</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">환경</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">교육</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">과학</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">보건●의료</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">보건●복지</a></li>
                        </ul>
                        <ul class="nav_ul">
                            <h4 class="sub_title">경제</h4>
                            <li class="nav_li"><a href="#" class="nav_a">기업●산업</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">부동산</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">금융</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">자동차</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">유통</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">증권</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">IT●인터넷</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">정책</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">비즈브리핑</a></li>
                        </ul>
                        <ul class="nav_ul">
                            <h4 class="sub_title">국제</h4>
                            <li class="nav_li"><a href="#" class="nav_a">국제경제</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">중국</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">일본</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">중동●아프리카</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">아세아●오세아니아</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">미국●중남미</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">유럽</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">지구촌화제</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">글로벌인사이트</a></li>
                        </ul>
                        <ul class="nav_ul">
                            <h4 class="sub_title">문화</h4>
                            <li class="nav_li"><a href="#" class="nav_a">음악</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">학술</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">미술●전시</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">출판●문학</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">대중문화</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">종교</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">여행</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">건강</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">반려동물</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">영화</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">공연</a></li>
                        </ul>
                        <ul class="nav_ul">
                            <h4 class="sub_title">스포츠</h4>
                            <li class="nav_li"><a href="#" class="nav_a">야구</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">축구</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">골프</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">농구</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">배구</a></li>
                        </ul>
                        <ul class="nav_ul">
                            <h4 class="sub_title">연예</h4>
                            <li class="nav_li"><a href="#" class="nav_a">방송</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">영화</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">해외연예</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">뮤직</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">스타요즘</a></li>
                        </ul>   
                    </ul>
                </li>
                <li class="dropdown"><a href="#" class="nav_title">사회</a>
                    <ul class="menu-area">
                        <ul class="nav_ul">
                            <h4 class="sub_title">정치</h4>
                            <li class="nav_li"><a href="#" class="nav_a">대통령</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">국회</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">북한</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">국방●외교</a></li>
                        </ul>
                        <ul class="nav_ul">
                            <h4 class="sub_title">사회</h4>
                            <li class="nav_li"><a href="#" class="nav_a">사건●사고</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">법원●검찰</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">환경</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">교육</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">과학</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">보건●의료</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">보건●복지</a></li>
                        </ul>
                        <ul class="nav_ul">
                            <h4 class="sub_title">경제</h4>
                            <li class="nav_li"><a href="#" class="nav_a">기업●산업</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">부동산</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">금융</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">자동차</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">유통</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">증권</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">IT●인터넷</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">정책</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">비즈브리핑</a></li>
                        </ul>
                        <ul class="nav_ul">
                            <h4 class="sub_title">국제</h4>
                            <li class="nav_li"><a href="#" class="nav_a">국제경제</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">중국</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">일본</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">중동●아프리카</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">아세아●오세아니아</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">미국●중남미</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">유럽</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">지구촌화제</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">글로벌인사이트</a></li>
                        </ul>
                        <ul class="nav_ul">
                            <h4 class="sub_title">문화</h4>
                            <li class="nav_li"><a href="#" class="nav_a">음악</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">학술</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">미술●전시</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">출판●문학</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">대중문화</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">종교</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">여행</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">건강</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">반려동물</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">영화</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">공연</a></li>
                        </ul>
                        <ul class="nav_ul">
                            <h4 class="sub_title">스포츠</h4>
                            <li class="nav_li"><a href="#" class="nav_a">야구</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">축구</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">골프</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">농구</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">배구</a></li>
                        </ul>
                        <ul class="nav_ul">
                            <h4 class="sub_title">연예</h4>
                            <li class="nav_li"><a href="#" class="nav_a">방송</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">영화</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">해외연예</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">뮤직</a></li>
                            <li class="nav_li"><a href="#" class="nav_a">스타요즘</a></li>
                        </ul>   
                    </ul>
                </li>
                    <li class="dropdown"><a href="#" class="nav_title">경제</a>
                        <ul class="menu-area">
                            <ul class="nav_ul">
                                <h4 class="sub_title">정치</h4>
                                <li class="nav_li"><a href="#" class="nav_a">대통령</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">국회</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">북한</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">국방●외교</a></li>
                            </ul>
                            <ul class="nav_ul">
                                <h4 class="sub_title">사회</h4>
                                <li class="nav_li"><a href="#" class="nav_a">사건●사고</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">법원●검찰</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">환경</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">교육</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">과학</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">보건●의료</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">보건●복지</a></li>
                            </ul>
                            <ul class="nav_ul">
                                <h4 class="sub_title">경제</h4>
                                <li class="nav_li"><a href="#" class="nav_a">기업●산업</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">부동산</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">금융</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">자동차</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">유통</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">증권</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">IT●인터넷</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">정책</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">비즈브리핑</a></li>
                            </ul>
                            <ul class="nav_ul">
                                <h4 class="sub_title">국제</h4>
                                <li class="nav_li"><a href="#" class="nav_a">국제경제</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">중국</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">일본</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">중동●아프리카</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">아세아●오세아니아</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">미국●중남미</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">유럽</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">지구촌화제</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">글로벌인사이트</a></li>
                            </ul>
                            <ul class="nav_ul">
                                <h4 class="sub_title">문화</h4>
                                <li class="nav_li"><a href="#" class="nav_a">음악</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">학술</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">미술●전시</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">출판●문학</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">대중문화</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">종교</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">여행</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">건강</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">반려동물</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">영화</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">공연</a></li>
                            </ul>
                            <ul class="nav_ul">
                                <h4 class="sub_title">스포츠</h4>
                                <li class="nav_li"><a href="#" class="nav_a">야구</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">축구</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">골프</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">농구</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">배구</a></li>
                            </ul>
                            <ul class="nav_ul">
                                <h4 class="sub_title">연예</h4>
                                <li class="nav_li"><a href="#" class="nav_a">방송</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">영화</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">해외연예</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">뮤직</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">스타요즘</a></li>
                            </ul>   
                        </ul>
                    </li>
                    <li class="dropdown"><a href="#" class="nav_title">국제</a>
                        <ul class="menu-area">
                            <ul class="nav_ul">
                                <h4 class="sub_title">정치</h4>
                                <li class="nav_li"><a href="#" class="nav_a">대통령</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">국회</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">북한</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">국방●외교</a></li>
                            </ul>
                            <ul class="nav_ul">
                                <h4 class="sub_title">사회</h4>
                                <li class="nav_li"><a href="#" class="nav_a">사건●사고</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">법원●검찰</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">환경</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">교육</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">과학</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">보건●의료</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">보건●복지</a></li>
                            </ul>
                            <ul class="nav_ul">
                                <h4 class="sub_title">경제</h4>
                                <li class="nav_li"><a href="#" class="nav_a">기업●산업</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">부동산</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">금융</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">자동차</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">유통</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">증권</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">IT●인터넷</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">정책</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">비즈브리핑</a></li>
                            </ul>
                            <ul class="nav_ul">
                                <h4 class="sub_title">국제</h4>
                                <li class="nav_li"><a href="#" class="nav_a">국제경제</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">중국</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">일본</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">중동●아프리카</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">아세아●오세아니아</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">미국●중남미</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">유럽</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">지구촌화제</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">글로벌인사이트</a></li>
                            </ul>
                            <ul class="nav_ul">
                                <h4 class="sub_title">문화</h4>
                                <li class="nav_li"><a href="#" class="nav_a">음악</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">학술</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">미술●전시</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">출판●문학</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">대중문화</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">종교</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">여행</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">건강</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">반려동물</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">영화</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">공연</a></li>
                            </ul>
                            <ul class="nav_ul">
                                <h4 class="sub_title">스포츠</h4>
                                <li class="nav_li"><a href="#" class="nav_a">야구</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">축구</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">골프</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">농구</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">배구</a></li>
                            </ul>
                            <ul class="nav_ul">
                                <h4 class="sub_title">연예</h4>
                                <li class="nav_li"><a href="#" class="nav_a">방송</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">영화</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">해외연예</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">뮤직</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">스타요즘</a></li>
                            </ul>   
                        </ul>
                    </li>
                    <li class="dropdown"><a href="#" class="nav_title">문화</a>
                        <ul class="menu-area">
                            <ul class="nav_ul">
                                <h4 class="sub_title">정치</h4>
                                <li class="nav_li"><a href="#" class="nav_a">대통령</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">국회</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">북한</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">국방●외교</a></li>
                            </ul>
                            <ul class="nav_ul">
                                <h4 class="sub_title">사회</h4>
                                <li class="nav_li"><a href="#" class="nav_a">사건●사고</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">법원●검찰</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">환경</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">교육</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">과학</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">보건●의료</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">보건●복지</a></li>
                            </ul>
                            <ul class="nav_ul">
                                <h4 class="sub_title">경제</h4>
                                <li class="nav_li"><a href="#" class="nav_a">기업●산업</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">부동산</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">금융</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">자동차</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">유통</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">증권</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">IT●인터넷</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">정책</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">비즈브리핑</a></li>
                            </ul>
                            <ul class="nav_ul">
                                <h4 class="sub_title">국제</h4>
                                <li class="nav_li"><a href="#" class="nav_a">국제경제</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">중국</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">일본</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">중동●아프리카</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">아세아●오세아니아</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">미국●중남미</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">유럽</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">지구촌화제</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">글로벌인사이트</a></li>
                            </ul>
                            <ul class="nav_ul">
                                <h4 class="sub_title">문화</h4>
                                <li class="nav_li"><a href="#" class="nav_a">음악</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">학술</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">미술●전시</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">출판●문학</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">대중문화</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">종교</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">여행</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">건강</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">반려동물</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">영화</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">공연</a></li>
                            </ul>
                            <ul class="nav_ul">
                                <h4 class="sub_title">스포츠</h4>
                                <li class="nav_li"><a href="#" class="nav_a">야구</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">축구</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">골프</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">농구</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">배구</a></li>
                            </ul>
                            <ul class="nav_ul">
                                <h4 class="sub_title">연예</h4>
                                <li class="nav_li"><a href="#" class="nav_a">방송</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">영화</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">해외연예</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">뮤직</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">스타요즘</a></li>
                            </ul>   
                        </ul>
                    </li>    
                    <li class="dropdown"><a href="#" class="nav_title">스포츠</a>
                        <ul class="menu-area">
                            <ul class="nav_ul">
                                <h4 class="sub_title">정치</h4>
                                <li class="nav_li"><a href="#" class="nav_a">대통령</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">국회</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">북한</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">국방●외교</a></li>
                            </ul>
                            <ul class="nav_ul">
                                <h4 class="sub_title">사회</h4>
                                <li class="nav_li"><a href="#" class="nav_a">사건●사고</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">법원●검찰</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">환경</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">교육</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">과학</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">보건●의료</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">보건●복지</a></li>
                            </ul>
                            <ul class="nav_ul">
                                <h4 class="sub_title">경제</h4>
                                <li class="nav_li"><a href="#" class="nav_a">기업●산업</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">부동산</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">금융</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">자동차</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">유통</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">증권</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">IT●인터넷</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">정책</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">비즈브리핑</a></li>
                            </ul>
                            <ul class="nav_ul">
                                <h4 class="sub_title">국제</h4>
                                <li class="nav_li"><a href="#" class="nav_a">국제경제</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">중국</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">일본</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">중동●아프리카</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">아세아●오세아니아</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">미국●중남미</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">유럽</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">지구촌화제</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">글로벌인사이트</a></li>
                            </ul>
                            <ul class="nav_ul">
                                <h4 class="sub_title">문화</h4>
                                <li class="nav_li"><a href="#" class="nav_a">음악</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">학술</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">미술●전시</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">출판●문학</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">대중문화</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">종교</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">여행</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">건강</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">반려동물</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">영화</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">공연</a></li>
                            </ul>
                            <ul class="nav_ul">
                                <h4 class="sub_title">스포츠</h4>
                                <li class="nav_li"><a href="#" class="nav_a">야구</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">축구</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">골프</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">농구</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">배구</a></li>
                            </ul>
                            <ul class="nav_ul">
                                <h4 class="sub_title">연예</h4>
                                <li class="nav_li"><a href="#" class="nav_a">방송</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">영화</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">해외연예</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">뮤직</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">스타요즘</a></li>
                            </ul>   
                        </ul>
                    </li>
                    <li class="dropdown"><a href="#" class="nav_title">연예</a>
                        <ul class="menu-area">
                            <ul class="nav_ul">
                                <h4 class="sub_title">정치</h4>
                                <li class="nav_li"><a href="#" class="nav_a">대통령</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">국회</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">북한</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">국방●외교</a></li>
                            </ul>
                            <ul class="nav_ul">
                                <h4 class="sub_title">사회</h4>
                                <li class="nav_li"><a href="#" class="nav_a">사건●사고</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">법원●검찰</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">환경</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">교육</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">과학</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">보건●의료</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">보건●복지</a></li>
                            </ul>
                            <ul class="nav_ul">
                                <h4 class="sub_title">경제</h4>
                                <li class="nav_li"><a href="#" class="nav_a">기업●산업</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">부동산</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">금융</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">자동차</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">유통</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">증권</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">IT●인터넷</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">정책</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">비즈브리핑</a></li>
                            </ul>
                            <ul class="nav_ul">
                                <h4 class="sub_title">국제</h4>
                                <li class="nav_li"><a href="#" class="nav_a">국제경제</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">중국</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">일본</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">중동●아프리카</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">아세아●오세아니아</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">미국●중남미</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">유럽</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">지구촌화제</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">글로벌인사이트</a></li>
                            </ul>
                            <ul class="nav_ul">
                                <h4 class="sub_title">문화</h4>
                                <li class="nav_li"><a href="#" class="nav_a">음악</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">학술</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">미술●전시</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">출판●문학</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">대중문화</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">종교</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">여행</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">건강</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">반려동물</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">영화</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">공연</a></li>
                            </ul>
                            <ul class="nav_ul">
                                <h4 class="sub_title">스포츠</h4>
                                <li class="nav_li"><a href="#" class="nav_a">야구</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">축구</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">골프</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">농구</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">배구</a></li>
                            </ul>
                            <ul class="nav_ul">
                                <h4 class="sub_title">연예</h4>
                                <li class="nav_li"><a href="#" class="nav_a">방송</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">영화</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">해외연예</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">뮤직</a></li>
                                <li class="nav_li"><a href="#" class="nav_a">스타요즘</a></li>
                            </ul>   
                        </ul>
                    </li>
            </ul>
        </nav>
        
    </div>

    <!-- 메인 슬라이더 -->
    <img src="" class="main_silde">


    <!-- 게시물 -->

    <!-- 음주단속/교통정보 -->

   <!-- footer -->
 <html class="footer_html">
    <body class="footer_body">

        <div></div>
        <footer class="footer">
            <div class="footer-container">
                <div class="footer-top">
                    <div>
                        <h6 class="footer-title">정치</h6>
                        <ul class="footer-list">
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">대통령</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">국회</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">북한</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">국방●외교</a>
                            </li>
                        </ul>
                    </div>
                    <div>
                        <h6 class="footer-title">사회</h6>
                        <ul class="footer-list">
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">사건●사고</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">법원●검찰</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">환경</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">교육</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">과학</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">보건●의료</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">보건●복지</a>
                            </li>
                        </ul>
                    </div>
                    <div>
                        <h6 class="footer-title">경제</h6>
                        <ul class="footer-list">
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">기업●산업</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">부동산</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">금융</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">자동차</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">유통</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">증권</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">IT●인터넷</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">정책</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">비즈브리핑</a>
                            </li>
                        </ul>
                    </div>
                    <div>
                        <h6 class="footer-title">국제</h6>
                        <ul class="footer-list">
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">국제경제</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">중국</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">일본</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">중동●아프리카</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">아세아●오세아니아</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">미국●중남미</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">유럽</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">지구촌화제</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">글로벌인사이트</a>
                            </li>
                        </ul>
                    </div>
                    <div>
                        <h6 class="footer-title">문화</h6>
                        <ul class="footer-list">
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">음악</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">학술</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">미술●전시</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">출판●문학</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">대중문화</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">종교</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">여행</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">건강</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">반려동물</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">영화</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">공연</a>
                            </li>
                        </ul>
                    </div>
                    <div>
                        <h6 class="footer-title">스포츠</h6>
                        <ul class="footer-list">
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">야구</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">축구</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">골프</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">농구</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">배구</a>
                            </li>
                        </ul>
                    </div>
                    <div>
                        <h6 class="footer-title">연예</h6>
                        <ul class="footer-list">
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">방송</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">영화</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">해외연예</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">뮤직</a>
                            </li>
                            <li class="footer-list-item">
                                <a href="#" class="footer-list-link">스타요즘</a>
                            </li>
                        </ul>
                    </div>
                    
                </div>
    
                <hr class="footer-divider">
    
                <div class="footer-bottom">
                    <span class="copyright">&copy; GlobalTimes. All rights reserved.</span>
                    <ul class="footer-list">
                        <li class="footer-list-item">
                            <a href="#" class="footer-list-link">
                                <i class="ri-facebook-circle-line"></i>
                            </a>
                        </li>
                        <li class="footer-list-item">
                            <a href="#" class="footer-list-link">
                                <i class="ri-instagram-line"></i>
                            </a>
                        </li>
                        <li class="footer-list-item">
                            <a href="#" class="footer-list-link">
                                <i class="ri-twitter-line"></i>
                            </a>
                        </li>
                    </ul>
                </div>
    
            </div>
        </footer>
    
</body>
</html>
