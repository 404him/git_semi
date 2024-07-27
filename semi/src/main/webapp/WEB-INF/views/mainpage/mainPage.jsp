<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Global Times</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/main.css">
</head>

<body>
    <!-- 해더 메인로고 -->
    <header class="container">
        <h1><img class="main_logo" src="${pageContext.request.contextPath}/resources/member/세미로고.png" alt="main_logo" onclick="location.href='#'"></h1>
            <span class="r_posi">
            <ul class="r_info">
                <li class="r_li"><a href="#">신문구독</a></li>
                <li class="r_li"><a href="#">로그인</a></li>
                <li class="r_li"><a href="#">회원가입</a></li>
            </ul>
            </span>
    </header>
        <!-- 세계시간 -->
     

        <!-- 네비바 -->
    <div class="wrapper">
        <nav>
            <ul>
                <li class="dropdown"><a href="#">정치</a>
                    <ul class="menu-area">
                        <ul>
                            <h4>정치</h4>
                            <li><a href="#">대통령</a></li>
                            <li><a href="#">국회</a></li>
                            <li><a href="#">북한</a></li>
                            <li><a href="#">국방●외교</a></li>
                        </ul>
                        <ul>
                            <h4>사회</h4>
                            <li><a href="#">사건●사고</a></li>
                            <li><a href="#">법원●검찰</a></li>
                            <li><a href="#">환경</a></li>
                            <li><a href="#">교육</a></li>
                            <li><a href="#">과학</a></li>
                            <li><a href="#">보건●의료</a></li>
                            <li><a href="#">보건●복지</a></li>
                        </ul>
                        <ul>
                            <h4>경제</h4>
                            <li><a href="#">기업●산업</a></li>
                            <li><a href="#">부동산</a></li>
                            <li><a href="#">금융</a></li>
                            <li><a href="#">자동차</a></li>
                            <li><a href="#">유통</a></li>
                            <li><a href="#">증권</a></li>
                            <li><a href="#">IT●인터넷</a></li>
                            <li><a href="#">정책</a></li>
                            <li><a href="#">비즈브리핑</a></li>
                        </ul>
                        <ul>
                            <h4>국제</h4>
                            <li><a href="#">국제경제</a></li>
                            <li><a href="#">중국</a></li>
                            <li><a href="#">일본</a></li>
                            <li><a href="#">중동●아프리카</a></li>
                            <li><a href="#">아세아●오세아니아</a></li>
                            <li><a href="#">미국●중남미</a></li>
                            <li><a href="#">유럽</a></li>
                            <li><a href="#">지구촌화제</a></li>
                            <li><a href="#">글로벌인사이트</a></li>
                        </ul>
                        <ul>
                            <h4>문화</h4>
                            <li><a href="#">음악</a></li>
                            <li><a href="#">학술</a></li>
                            <li><a href="#">미술●전시</a></li>
                            <li><a href="#">출판●문학</a></li>
                            <li><a href="#">대중문화</a></li>
                            <li><a href="#">종교</a></li>
                            <li><a href="#">여행</a></li>
                            <li><a href="#">건강</a></li>
                            <li><a href="#">반려동물</a></li>
                            <li><a href="#">영화</a></li>
                            <li><a href="#">공연</a></li>
                        </ul>
                        <ul>
                            <h4>스포츠</h4>
                            <li><a href="#">야구</a></li>
                            <li><a href="#">축구</a></li>
                            <li><a href="#">골프</a></li>
                            <li><a href="#">농구</a></li>
                            <li><a href="#">배구</a></li>
                        </ul>
                        <ul>
                            <h4>연예</h4>
                            <li><a href="#">방송</a></li>
                            <li><a href="#">영화</a></li>
                            <li><a href="#">해외연예</a></li>
                            <li><a href="#">뮤직</a></li>
                            <li><a href="#">스타요즘</a></li>
                        </ul>   
                    </ul>
                </li>
                <li class="dropdown"><a href="#">사회</a>
                    <ul class="menu-area">
                        <ul>
                            <h4>정치</h4>
                            <li><a href="#">대통령</a></li>
                            <li><a href="#">국회</a></li>
                            <li><a href="#">북한</a></li>
                            <li><a href="#">국방●외교</a></li>
                        </ul>
                        <ul>
                            <h4>사회</h4>
                            <li><a href="#">사건●사고</a></li>
                            <li><a href="#">법원●검찰</a></li>
                            <li><a href="#">환경</a></li>
                            <li><a href="#">교육</a></li>
                            <li><a href="#">과학</a></li>
                            <li><a href="#">보건●의료</a></li>
                            <li><a href="#">보건●복지</a></li>
                        </ul>
                        <ul>
                            <h4>경제</h4>
                            <li><a href="#">기업●산업</a></li>
                            <li><a href="#">부동산</a></li>
                            <li><a href="#">금융</a></li>
                            <li><a href="#">자동차</a></li>
                            <li><a href="#">유통</a></li>
                            <li><a href="#">증권</a></li>
                            <li><a href="#">IT●인터넷</a></li>
                            <li><a href="#">정책</a></li>
                            <li><a href="#">비즈브리핑</a></li>
                        </ul>
                        <ul>
                            <h4>국제</h4>
                            <li><a href="#">국제경제</a></li>
                            <li><a href="#">중국</a></li>
                            <li><a href="#">일본</a></li>
                            <li><a href="#">중동●아프리카</a></li>
                            <li><a href="#">아세아●오세아니아</a></li>
                            <li><a href="#">미국●중남미</a></li>
                            <li><a href="#">유럽</a></li>
                            <li><a href="#">지구촌화제</a></li>
                            <li><a href="#">글로벌인사이트</a></li>
                        </ul>
                        <ul>
                            <h4>문화</h4>
                            <li><a href="#">음악</a></li>
                            <li><a href="#">학술</a></li>
                            <li><a href="#">미술●전시</a></li>
                            <li><a href="#">출판●문학</a></li>
                            <li><a href="#">대중문화</a></li>
                            <li><a href="#">종교</a></li>
                            <li><a href="#">여행</a></li>
                            <li><a href="#">건강</a></li>
                            <li><a href="#">반려동물</a></li>
                            <li><a href="#">영화</a></li>
                            <li><a href="#">공연</a></li>
                        </ul>
                        <ul>
                            <h4>스포츠</h4>
                            <li><a href="#">야구</a></li>
                            <li><a href="#">축구</a></li>
                            <li><a href="#">골프</a></li>
                            <li><a href="#">농구</a></li>
                            <li><a href="#">배구</a></li>
                        </ul>
                        <ul>
                            <h4>연예</h4>
                            <li><a href="#">방송</a></li>
                            <li><a href="#">영화</a></li>
                            <li><a href="#">해외연예</a></li>
                            <li><a href="#">뮤직</a></li>
                            <li><a href="#">스타요즘</a></li>
                        </ul>   
                    </ul>
                </li>
                    <li class="dropdown"><a href="#">경제</a>
                        <ul class="menu-area">
                            <ul>
                                <h4>정치</h4>
                                <li><a href="#">대통령</a></li>
                                <li><a href="#">국회</a></li>
                                <li><a href="#">북한</a></li>
                                <li><a href="#">국방●외교</a></li>
                            </ul>
                            <ul>
                                <h4>사회</h4>
                                <li><a href="#">사건●사고</a></li>
                                <li><a href="#">법원●검찰</a></li>
                                <li><a href="#">환경</a></li>
                                <li><a href="#">교육</a></li>
                                <li><a href="#">과학</a></li>
                                <li><a href="#">보건●의료</a></li>
                                <li><a href="#">보건●복지</a></li>
                            </ul>
                            <ul>
                                <h4>경제</h4>
                                <li><a href="#">기업●산업</a></li>
                                <li><a href="#">부동산</a></li>
                                <li><a href="#">금융</a></li>
                                <li><a href="#">자동차</a></li>
                                <li><a href="#">유통</a></li>
                                <li><a href="#">증권</a></li>
                                <li><a href="#">IT●인터넷</a></li>
                                <li><a href="#">정책</a></li>
                                <li><a href="#">비즈브리핑</a></li>
                            </ul>
                            <ul>
                                <h4>국제</h4>
                                <li><a href="#">국제경제</a></li>
                                <li><a href="#">중국</a></li>
                                <li><a href="#">일본</a></li>
                                <li><a href="#">중동●아프리카</a></li>
                                <li><a href="#">아세아●오세아니아</a></li>
                                <li><a href="#">미국●중남미</a></li>
                                <li><a href="#">유럽</a></li>
                                <li><a href="#">지구촌화제</a></li>
                                <li><a href="#">글로벌인사이트</a></li>
                            </ul>
                            <ul>
                                <h4>문화</h4>
                                <li><a href="#">음악</a></li>
                                <li><a href="#">학술</a></li>
                                <li><a href="#">미술●전시</a></li>
                                <li><a href="#">출판●문학</a></li>
                                <li><a href="#">대중문화</a></li>
                                <li><a href="#">종교</a></li>
                                <li><a href="#">여행</a></li>
                                <li><a href="#">건강</a></li>
                                <li><a href="#">반려동물</a></li>
                                <li><a href="#">영화</a></li>
                                <li><a href="#">공연</a></li>
                            </ul>
                            <ul>
                                <h4>스포츠</h4>
                                <li><a href="#">야구</a></li>
                                <li><a href="#">축구</a></li>
                                <li><a href="#">골프</a></li>
                                <li><a href="#">농구</a></li>
                                <li><a href="#">배구</a></li>
                            </ul>
                            <ul>
                                <h4>연예</h4>
                                <li><a href="#">방송</a></li>
                                <li><a href="#">영화</a></li>
                                <li><a href="#">해외연예</a></li>
                                <li><a href="#">뮤직</a></li>
                                <li><a href="#">스타요즘</a></li>
                            </ul>   
                        </ul>
                    </li>
                    <li class="dropdown"><a href="#">국제</a>
                        <ul class="menu-area">
                            <ul>
                                <h4>정치</h4>
                                <li><a href="#">대통령</a></li>
                                <li><a href="#">국회</a></li>
                                <li><a href="#">북한</a></li>
                                <li><a href="#">국방●외교</a></li>
                            </ul>
                            <ul>
                                <h4>사회</h4>
                                <li><a href="#">사건●사고</a></li>
                                <li><a href="#">법원●검찰</a></li>
                                <li><a href="#">환경</a></li>
                                <li><a href="#">교육</a></li>
                                <li><a href="#">과학</a></li>
                                <li><a href="#">보건●의료</a></li>
                                <li><a href="#">보건●복지</a></li>
                            </ul>
                            <ul>
                                <h4>경제</h4>
                                <li><a href="#">기업●산업</a></li>
                                <li><a href="#">부동산</a></li>
                                <li><a href="#">금융</a></li>
                                <li><a href="#">자동차</a></li>
                                <li><a href="#">유통</a></li>
                                <li><a href="#">증권</a></li>
                                <li><a href="#">IT●인터넷</a></li>
                                <li><a href="#">정책</a></li>
                                <li><a href="#">비즈브리핑</a></li>
                            </ul>
                            <ul>
                                <h4>국제</h4>
                                <li><a href="#">국제경제</a></li>
                                <li><a href="#">중국</a></li>
                                <li><a href="#">일본</a></li>
                                <li><a href="#">중동●아프리카</a></li>
                                <li><a href="#">아세아●오세아니아</a></li>
                                <li><a href="#">미국●중남미</a></li>
                                <li><a href="#">유럽</a></li>
                                <li><a href="#">지구촌화제</a></li>
                                <li><a href="#">글로벌인사이트</a></li>
                            </ul>
                            <ul>
                                <h4>문화</h4>
                                <li><a href="#">음악</a></li>
                                <li><a href="#">학술</a></li>
                                <li><a href="#">미술●전시</a></li>
                                <li><a href="#">출판●문학</a></li>
                                <li><a href="#">대중문화</a></li>
                                <li><a href="#">종교</a></li>
                                <li><a href="#">여행</a></li>
                                <li><a href="#">건강</a></li>
                                <li><a href="#">반려동물</a></li>
                                <li><a href="#">영화</a></li>
                                <li><a href="#">공연</a></li>
                            </ul>
                            <ul>
                                <h4>스포츠</h4>
                                <li><a href="#">야구</a></li>
                                <li><a href="#">축구</a></li>
                                <li><a href="#">골프</a></li>
                                <li><a href="#">농구</a></li>
                                <li><a href="#">배구</a></li>
                            </ul>
                            <ul>
                                <h4>연예</h4>
                                <li><a href="#">방송</a></li>
                                <li><a href="#">영화</a></li>
                                <li><a href="#">해외연예</a></li>
                                <li><a href="#">뮤직</a></li>
                                <li><a href="#">스타요즘</a></li>
                            </ul>   
                        </ul>
                    </li>
                    <li class="dropdown"><a href="#">문화</a>
                        <ul class="menu-area">
                            <ul>
                                <h4>정치</h4>
                                <li><a href="#">대통령</a></li>
                                <li><a href="#">국회</a></li>
                                <li><a href="#">북한</a></li>
                                <li><a href="#">국방●외교</a></li>
                            </ul>
                            <ul>
                                <h4>사회</h4>
                                <li><a href="#">사건●사고</a></li>
                                <li><a href="#">법원●검찰</a></li>
                                <li><a href="#">환경</a></li>
                                <li><a href="#">교육</a></li>
                                <li><a href="#">과학</a></li>
                                <li><a href="#">보건●의료</a></li>
                                <li><a href="#">보건●복지</a></li>
                            </ul>
                            <ul>
                                <h4>경제</h4>
                                <li><a href="#">기업●산업</a></li>
                                <li><a href="#">부동산</a></li>
                                <li><a href="#">금융</a></li>
                                <li><a href="#">자동차</a></li>
                                <li><a href="#">유통</a></li>
                                <li><a href="#">증권</a></li>
                                <li><a href="#">IT●인터넷</a></li>
                                <li><a href="#">정책</a></li>
                                <li><a href="#">비즈브리핑</a></li>
                            </ul>
                            <ul>
                                <h4>국제</h4>
                                <li><a href="#">국제경제</a></li>
                                <li><a href="#">중국</a></li>
                                <li><a href="#">일본</a></li>
                                <li><a href="#">중동●아프리카</a></li>
                                <li><a href="#">아세아●오세아니아</a></li>
                                <li><a href="#">미국●중남미</a></li>
                                <li><a href="#">유럽</a></li>
                                <li><a href="#">지구촌화제</a></li>
                                <li><a href="#">글로벌인사이트</a></li>
                            </ul>
                            <ul>
                                <h4>문화</h4>
                                <li><a href="#">음악</a></li>
                                <li><a href="#">학술</a></li>
                                <li><a href="#">미술●전시</a></li>
                                <li><a href="#">출판●문학</a></li>
                                <li><a href="#">대중문화</a></li>
                                <li><a href="#">종교</a></li>
                                <li><a href="#">여행</a></li>
                                <li><a href="#">건강</a></li>
                                <li><a href="#">반려동물</a></li>
                                <li><a href="#">영화</a></li>
                                <li><a href="#">공연</a></li>
                            </ul>
                            <ul>
                                <h4>스포츠</h4>
                                <li><a href="#">야구</a></li>
                                <li><a href="#">축구</a></li>
                                <li><a href="#">골프</a></li>
                                <li><a href="#">농구</a></li>
                                <li><a href="#">배구</a></li>
                            </ul>
                            <ul>
                                <h4>연예</h4>
                                <li><a href="#">방송</a></li>
                                <li><a href="#">영화</a></li>
                                <li><a href="#">해외연예</a></li>
                                <li><a href="#">뮤직</a></li>
                                <li><a href="#">스타요즘</a></li>
                            </ul>   
                        </ul>
                    </li>    
                    <li class="dropdown"><a href="#">스포츠</a>
                        <ul class="menu-area">
                            <ul>
                                <h4>정치</h4>
                                <li><a href="#">대통령</a></li>
                                <li><a href="#">국회</a></li>
                                <li><a href="#">북한</a></li>
                                <li><a href="#">국방●외교</a></li>
                            </ul>
                            <ul>
                                <h4>사회</h4>
                                <li><a href="#">사건●사고</a></li>
                                <li><a href="#">법원●검찰</a></li>
                                <li><a href="#">환경</a></li>
                                <li><a href="#">교육</a></li>
                                <li><a href="#">과학</a></li>
                                <li><a href="#">보건●의료</a></li>
                                <li><a href="#">보건●복지</a></li>
                            </ul>
                            <ul>
                                <h4>경제</h4>
                                <li><a href="#">기업●산업</a></li>
                                <li><a href="#">부동산</a></li>
                                <li><a href="#">금융</a></li>
                                <li><a href="#">자동차</a></li>
                                <li><a href="#">유통</a></li>
                                <li><a href="#">증권</a></li>
                                <li><a href="#">IT●인터넷</a></li>
                                <li><a href="#">정책</a></li>
                                <li><a href="#">비즈브리핑</a></li>
                            </ul>
                            <ul>
                                <h4>국제</h4>
                                <li><a href="#">국제경제</a></li>
                                <li><a href="#">중국</a></li>
                                <li><a href="#">일본</a></li>
                                <li><a href="#">중동●아프리카</a></li>
                                <li><a href="#">아세아●오세아니아</a></li>
                                <li><a href="#">미국●중남미</a></li>
                                <li><a href="#">유럽</a></li>
                                <li><a href="#">지구촌화제</a></li>
                                <li><a href="#">글로벌인사이트</a></li>
                            </ul>
                            <ul>
                                <h4>문화</h4>
                                <li><a href="#">음악</a></li>
                                <li><a href="#">학술</a></li>
                                <li><a href="#">미술●전시</a></li>
                                <li><a href="#">출판●문학</a></li>
                                <li><a href="#">대중문화</a></li>
                                <li><a href="#">종교</a></li>
                                <li><a href="#">여행</a></li>
                                <li><a href="#">건강</a></li>
                                <li><a href="#">반려동물</a></li>
                                <li><a href="#">영화</a></li>
                                <li><a href="#">공연</a></li>
                            </ul>
                            <ul>
                                <h4>스포츠</h4>
                                <li><a href="#">야구</a></li>
                                <li><a href="#">축구</a></li>
                                <li><a href="#">골프</a></li>
                                <li><a href="#">농구</a></li>
                                <li><a href="#">배구</a></li>
                            </ul>
                            <ul>
                                <h4>연예</h4>
                                <li><a href="#">방송</a></li>
                                <li><a href="#">영화</a></li>
                                <li><a href="#">해외연예</a></li>
                                <li><a href="#">뮤직</a></li>
                                <li><a href="#">스타요즘</a></li>
                            </ul>   
                        </ul>
                    </li>
                    <li class="dropdown"><a href="#">연예</a>
                        <ul class="menu-area">
                            <ul>
                                <h4>정치</h4>
                                <li><a href="#">대통령</a></li>
                                <li><a href="#">국회</a></li>
                                <li><a href="#">북한</a></li>
                                <li><a href="#">국방●외교</a></li>
                            </ul>
                            <ul>
                                <h4>사회</h4>
                                <li><a href="#">사건●사고</a></li>
                                <li><a href="#">법원●검찰</a></li>
                                <li><a href="#">환경</a></li>
                                <li><a href="#">교육</a></li>
                                <li><a href="#">과학</a></li>
                                <li><a href="#">보건●의료</a></li>
                                <li><a href="#">보건●복지</a></li>
                            </ul>
                            <ul>
                                <h4>경제</h4>
                                <li><a href="#">기업●산업</a></li>
                                <li><a href="#">부동산</a></li>
                                <li><a href="#">금융</a></li>
                                <li><a href="#">자동차</a></li>
                                <li><a href="#">유통</a></li>
                                <li><a href="#">증권</a></li>
                                <li><a href="#">IT●인터넷</a></li>
                                <li><a href="#">정책</a></li>
                                <li><a href="#">비즈브리핑</a></li>
                            </ul>
                            <ul>
                                <h4>국제</h4>
                                <li><a href="#">국제경제</a></li>
                                <li><a href="#">중국</a></li>
                                <li><a href="#">일본</a></li>
                                <li><a href="#">중동●아프리카</a></li>
                                <li><a href="#">아세아●오세아니아</a></li>
                                <li><a href="#">미국●중남미</a></li>
                                <li><a href="#">유럽</a></li>
                                <li><a href="#">지구촌화제</a></li>
                                <li><a href="#">글로벌인사이트</a></li>
                            </ul>
                            <ul>
                                <h4>문화</h4>
                                <li><a href="#">음악</a></li>
                                <li><a href="#">학술</a></li>
                                <li><a href="#">미술●전시</a></li>
                                <li><a href="#">출판●문학</a></li>
                                <li><a href="#">대중문화</a></li>
                                <li><a href="#">종교</a></li>
                                <li><a href="#">여행</a></li>
                                <li><a href="#">건강</a></li>
                                <li><a href="#">반려동물</a></li>
                                <li><a href="#">영화</a></li>
                                <li><a href="#">공연</a></li>
                            </ul>
                            <ul>
                                <h4>스포츠</h4>
                                <li><a href="#">야구</a></li>
                                <li><a href="#">축구</a></li>
                                <li><a href="#">골프</a></li>
                                <li><a href="#">농구</a></li>
                                <li><a href="#">배구</a></li>
                            </ul>
                            <ul>
                                <h4>연예</h4>
                                <li><a href="#">방송</a></li>
                                <li><a href="#">영화</a></li>
                                <li><a href="#">해외연예</a></li>
                                <li><a href="#">뮤직</a></li>
                                <li><a href="#">스타요즘</a></li>
                            </ul>   
                        </ul>
                    </li>
            </ul>
        </nav>
        
    </div>
   


    <!-- 메인 슬라이더 -->

    <!-- footer -->
   


</body>
</html>
