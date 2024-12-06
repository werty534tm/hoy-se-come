"use strict";(("undefined"!=typeof self?self:global).webpackChunkclient_web=("undefined"!=typeof self?self:global).webpackChunkclient_web||[]).push([[3838],{17890:(e,t,n)=>{n.r(t),n.d(t,{CulturalMomentHub:()=>te,REDIRECT_BASE:()=>G,default:()=>ne});var i=n(63166),s=n(30758),l=n(97500),r=n.n(l),o=n(70750),a=n(64721),c=n(5608),u=n(18212),d=n(9498),m=n(50780),h=n(87244),p=n(29080),g=n(7777),f=n(98991),x=n(17067),b=n(8476),v=n(86070);const j=({image:e,color:t=m.vyq,title:n})=>{const i=void 0===e?h.K.SMALL:h.K.DEFAULT,s=e?.custom?.sizes?.flatMap((e=>e.uri?[{url:e.uri,width:e.width,height:e.height}]:[]))??(e?.uri?[{url:e?.uri}]:[]);return(0,v.jsxs)(v.Fragment,{children:[(0,v.jsxs)(h.z,{backgroundImages:s,backgroundColor:t,size:i,children:[(0,v.jsx)(g.h,{children:n?(0,v.jsx)(f.X,{text:n}):null}),(0,v.jsx)(p.Y,{children:n?(0,v.jsx)(x.mm,{children:n}):null})]}),(0,v.jsx)(b.f,{color:t})]})};var y=n(75627),w=n(60367),k=n(95268),A=n(71420);const _=e=>{if("number"==typeof e){return new Date(1e3*e).toISOString()}return null};const N=(e,t,n)=>{if(void 0===e.id)return null;const i=t.map(((e,t)=>function(e,t){const n=e.component?.id,i=e.id;if(void 0===n||void 0===i)return null;const s=e.events?.click?.data?.uri,l=e.images?.main?.uri,r=l?[{url:l}]:[];switch(n){case"culturalmoments:mediumEpisodeCard":case"culturalmoments:episodeCardActionsMedium":return void 0===s?null:(0,v.jsx)(k.U,{uri:s,name:e.text?.title??"",images:r,showImages:r,description:e.text?.description??e.text?.subtitle??"",durationMilliseconds:(o=e.custom?.duration,"number"==typeof o?o:0),releaseDate:_(e.custom?.releaseDate),resume_point:null,isExplicit:!1,is19PlusOnly:!1,sharingInfo:null,index:t},i);case"culturalmoments:playlistCard":case"culturalmoments:playlistCardActionsMedium":return void 0===s?null:(0,v.jsx)(A.B,{uri:s,name:e.text?.title??"",images:r,description:e.text?.description??"",authorName:e.text?.subtitle??"",index:t},i);default:return null}var o}(e,t))).flatMap((e=>e?[e]:[]));if(0===i.length)return null;const s=(0,y.o_h)(e.events?.click?.data?.uri??"")?.toURLPath(!0);return(0,v.jsx)(w.p,{title:e.text?.title??"",total:i.length,seeAllUri:s,index:n,id:e.id,seeAllLabel:e.text?.accessory,children:i},e.id)};var I=n(99912),D=n(6128),C=n(90410),R=n(65152),E=n(55285),M=n(64864),S=n(11716),z=n(33058);const T="MT6jAR25XYfoarcSqHDd",B="IYZA3J2VTMydirxq_bdg",F="t6RJK1eND2uPmFYOi32l";var H=function(e){return e.ANDROID="https://play.google.com/store/apps/details?id=com.spotify.music",e.IOS="https://apps.apple.com/app/spotify-music/id324684580",e}(H||{});const L=({spec:e,model:t})=>{const n=a.Ru.getLocaleForTranslation(),i=(0,S.s)(),s=(0,z.t)(e),l=t.text?.title,o=t.text?.subtitle;if(void 0===l&&void 0===o)return null;const c=t=>{if(t===H.ANDROID){const n=e.googleBadgeFactory().hitNavigateToWebviewUri({destination:t});i.logInteraction(n)}else{const n=e.appleBadgeFactory().hitNavigateToWebviewUri({destination:t});i.logInteraction(n)}};return(0,v.jsxs)(I.a,{variant:"tinted",style:{width:600},ref:s,"data-testid":"unsupported-message",children:[(0,v.jsx)(D.E,{as:"p",variant:"bodyMediumBold",style:{marginBottom:C.v4},children:l}),(0,v.jsx)(D.E,{as:"p",variant:"bodySmall",style:{marginBottom:C.CD},children:o}),(0,v.jsxs)("div",{className:r()(F),children:[(0,v.jsx)(E.N,{to:H.IOS,target:"_blank",onClick:()=>c(H.IOS),children:(0,v.jsx)("img",{src:(0,R.b)((0,M.f)(n)),alt:a.Ru.get("web-player.cultural-moments.unsupported.appleAppStoreAlt"),className:T})}),(0,v.jsx)(E.N,{to:H.ANDROID,target:"_blank",onClick:()=>c(H.ANDROID),children:(0,v.jsx)("img",{src:(0,R.b)((0,M.A)(n)),alt:a.Ru.get("web-player.cultural-moments.unsupported.googlePlayStoreAlt"),className:r()(T,B)})})]})]})},O=(e,t)=>{const n=(e=>{const t=Array();let n,i=Array();return e.forEach((e=>{"culturalmoments:sectionHeaderWithAction"===e.component?.id?(n&&0!==i.length&&t.push({heading:n,components:i}),n=e,i=Array()):n&&("culturalmoments:carousel"===e.component?.id||"glue2:carousel"===e.component?.id?e.children?.forEach((e=>{i.push(e)})):i.push(e))})),n&&0!==i.length&&t.push({heading:n,components:i}),t})(e),i=(e=>e.find((e=>"culturalmoments:unavailableBanner"===e.component?.id)))(e);return(0,v.jsxs)(v.Fragment,{children:[i?(0,v.jsx)(L,{spec:t,model:i},i.component?.id):null,n.map(((e,t)=>N(e.heading,e.components,t)))]})};var V=n(7038),P=n(96022);const U=(e,t)=>{const n=new Intl.DateTimeFormat;return e.build().withHost(P.LG).withPath("/hub").withQueryParameters({id:t,userHasRiF:!1,clientTimezone:n.resolvedOptions().timeZone??""}).withoutMarket().withEndpointIdentifier("cultural-moment/hub").send()};var Z=n(76034),W=n(1620);const q="B9Q1L66F7wl4eUMgp4Lg",Q="gtqpWbwIV4PTEp8Q0ZW4",Y="edYsLe1QCBdzPglEiROZ",K=({uri:e,id:t})=>{const{data:n,error:i,loading:l}=(0,Z.Z)(U,[t]),{spec:m,UBIFragment:h}=(0,W.r)(o.j,{data:{identifier:e,uri:e}}),p=(0,s.useMemo)((()=>m.shelvesFactory()),[m]),g=(0,s.useMemo)((()=>m.mobilePromptFactory()),[m]),f=n?.body.hubViewData?.body,x=n?.body.hubViewData?.header;if(null===n||void 0===f||void 0===x||l||null!==i)return(0,v.jsx)(d.LoadingPage,{hasError:null!==i,errorMessage:a.Ru.get("error.generic")});const b=n.body.hubViewData?.title,y=x?.text?.title;return(0,v.jsxs)(h,{spec:m,children:[(0,v.jsx)(u.Q,{children:b??""}),y?(0,v.jsx)("div",{className:q,children:(0,v.jsx)(j,{title:x?.text?.title,image:x.images?.background})}):null,(0,v.jsx)(h,{spec:p,children:(0,v.jsxs)("div",{className:Y,children:[y&&(0,v.jsx)(c.K,{}),(0,v.jsx)("div",{className:r()("contentSpacing",Q),children:(0,v.jsx)(V._,{children:f?O(f,g):null})})]})})]})};var $=n(27317),J=n(65311),X=n(19412);const G="https://accounts.spotify.com/login",ee=()=>{const e=window.location.href;return window.location.href=`${G}?continue=${encodeURIComponent(e)}`,null},te=e=>{const t=(0,J.V)(),n=(0,i.NC)(X.Be8,{loadingValue:!1});return t?(0,v.jsx)(ee,{}):n?(0,v.jsx)(K,{...e}):(0,v.jsx)($.$,{to:"/"})},ne=te},7038:(e,t,n)=>{n.d(t,{_:()=>u});var i=n(30758),s=n(21743),l=n(97500),r=n.n(l);const o="eqw9lvuoZHrkWMTdyTpY",a="lb08f71wES9AQnKx6e0R";var c=n(86070);const u=(0,i.memo)((function(e){const{triggerOnInitialLoad:t=!1,onReachBottom:n,showScrollbar:l=!0,horizontalScroll:u=!1,className:d}=e,{ref:m,inView:h}=(0,s.Wx)({initialInView:t});return(0,i.useLayoutEffect)((()=>{h&&n&&n()}),[h,n]),(0,c.jsxs)("div",{className:r()({[a]:!l,[o]:u},d),"data-testid":"infinite-scroll-list",children:[e.children,(0,c.jsx)("div",{ref:m})]})}))},8476:(e,t,n)=>{n.d(t,{f:()=>o,z:()=>r});var i=n(30758),s=n(50780),l=n(57286);function r(e,t=s.l0o){const n=(0,l.as)();return(0,i.useEffect)((()=>(e&&n((0,l.Mo)(e)),()=>{n((0,l.Hf)())})),[e,n]),e||t}const o=({color:e,fallbackColor:t})=>(r(e,t),null)},64864:(e,t,n)=>{n.d(t,{A:()=>r,f:()=>l});const i=["ar","az","bg","cs_CZ","da","de","ee","el","en","es","es_mx","fi","fp","fr","fr_ca","he","hu","id","it","ja","ko","lt","lv","ms","mt","nb","nl","pl","pt","pt_br","ro","ru","sk","sl","sv","th_TH","tr","vi_VN","zh_HANS","zh_HANT"],s=["af","ar","am","az","be","bg","bn","bs","ca","cr","cs_CZ","da","de","el","en","es","es_419","et","eu","fa","fi","fp","fr","fr_ca","gl","gu","he","hi","hr","hu","hy","id","is","it","ja","ka","kk","km","kn","ko","ky","lo","lt","lv","mk","ml","mn","mr","ms","my","nb","ne","nl","pa","pl","pt","pt_br","ro","ru","si","sk","sl","sq","sr","sv","sw","ta","te","th_TH","tr","ua","ur","uz","vi_VN","zh_HANS","zh_HANT","zh_hk","zu"],l=e=>`images/download-badges/apple/${i.includes(e)?e:"int"}.svg`,r=e=>`images/download-badges/google/${s.includes(e)?e:"int"}.svg`}}]);
//# sourceMappingURL=xpui-routes-cultural-moment-hub.js.map