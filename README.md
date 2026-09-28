# 한양대학교 철학과 커뮤니티 1차 버전

구성:
- 공지
- 익명 토론게시판
- 익명 자유게시판
- 익명 댓글
- 과지 PDF 아카이브

## 실제 커뮤니티로 연결하기

1. Supabase 프로젝트를 하나 만듭니다.
2. `supabase.sql` 내용을 SQL Editor에서 실행합니다.
3. Storage에서 `magazines`라는 Public bucket을 만듭니다.
4. `index.html`의 `SUPABASE_URL`, `SUPABASE_ANON_KEY`를 프로젝트 값으로 교체합니다.
5. `index.html`, `style.css`를 Vercel/Netlify/GitHub Pages 등에 배포합니다.

## 과지
`magazines` Storage bucket에 PDF를 올리면 과지 메뉴에 표시됩니다.
현재 PDF는 새 탭에서 브라우저 기본 PDF 뷰어로 열립니다. 다음 버전에서는 실제 책처럼 페이지 넘김 UI(PDF.js)를 붙일 수 있습니다.

## 중요한 운영 기능
현재 버전은 이름/로그인 없이 누구나 글과 댓글을 작성하는 구조입니다.
실서비스 전에는 관리자 삭제/신고, 스팸 방지, 욕설 필터, 작성 빈도 제한을 추가하는 것이 좋습니다.
