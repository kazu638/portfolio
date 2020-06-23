document.addEventListener("turbolinks:load", () => {

  let items = 200;

  for (let i = 0; i <= items; i++) {
    let moveVal = Math.ceil( Math.random() * 50 );
    let posVal = Math.ceil( Math.random() * 50 );
    let scaleVal = Math.ceil( Math.random() * 10 );
    let shakeVal = Math.ceil( Math.random() * 50 );

    $(".side-box").append(`<div class="move${moveVal} pos${posVal}"><div class="scale${scaleVal}"><div class="item shake${shakeVal}"></div></div></div>`)
  }
})