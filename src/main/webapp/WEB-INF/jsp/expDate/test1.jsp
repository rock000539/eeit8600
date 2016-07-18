<!DOCTYPE html><html class=''>
<head><script src='//assets.codepen.io/assets/editor/live/console_runner-d0a557e5cb67f9cd9bbb9673355c7e8e.js'></script><script src='//assets.codepen.io/assets/editor/live/events_runner-21174b4c7273cfddc124acb0876792e0.js'></script><script src='//assets.codepen.io/assets/editor/live/css_live_reload_init-7618a0de08795409d8f6c9ef6805f7b2.js'></script><meta charset='UTF-8'><meta name="robots" content="noindex"><link rel="canonical" href="http://codepen.io/foolproof/pen/pgXQJK" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href='https://fonts.googleapis.com/css?family=Roboto:300,100' rel='stylesheet' type='text/css'>
<link rel='stylesheet prefetch' href='//codepen.io/assets/reset/reset.css'><script src='//codepen.io/assets/libs/prefixfree.min.js'></script>
<style class="cp-pen-styles">* {
  box-sizing: border-box;
}

button {
  outline: none;
  cursor: pointer;
  margin: 0;
}

body {
  background: #575757;
  font-family: 'Roboto', sans-serif;
  font-size: 16px;
  font-weight: 100;
  color: #fff;
}

.pen-wrapper {
  display: flex;
  width: 100%;
  height: calc(100vh - 85px);
  min-height: 500px;
  justify-content: space-around;
  align-items: center;
  flex-direction: column;
}
@media screen and (min-width: 768px) {
  .pen-wrapper {
    flex-direction: row;
  }
}

.pen-title {
  text-align: center;
  font-size: 20px;
  line-height: 40px;
  padding: 20px 0;
}
.pen-title a {
  text-decoration: underline;
  font-size: .75em;
  cursor: pointer;
}

.buton-cover {
  position: relative;
}

.btn, .button-slide-out__above {
  display: block;
  min-width: 120px;
  border: none;
  padding: 0 1em;
  font-size: 12px;
  color: #fff;
  line-height: 40px;
  text-align: center;
  background: none;
  transition: background .3s ease;
}

.btn--primary {
  background-color: #d65a57;
}
.btn--primary:hover {
  background-color: #db6e6b;
}

.btn--gray {
  background-color: #9c9c9c;
}
.btn--gray:hover {
  background-color: #8f8f8f;
}

.btn--gray-drk {
  background-color: #787878;
}
.btn--gray-drk:hover {
  background-color: #6b6b6b;
}

.btn__txt--inactive {
  display: block;
}
.is_active .btn__txt--inactive {
  display: none;
}

.btn__txt--active {
  display: none;
}
.is_active .btn__txt--active {
  display: block;
}

.button-set {
  display: flex;
  margin-top: 1px;
}
.button-set .btn, .button-set .button-slide-out__above {
  display: block;
  min-width: initial;
  width: 50%;
  padding: 0;
}

.button-3d {
  perspective: 200px;
}
.button-3d.is_active > .btn, .button-3d.is_active > .button-slide-out__above {
  background-color: #9c9c9c;
}

.button-3d__dropdown {
  overflow: hidden;
  transition: all 1s ease;
  transform: rotateX(-91deg);
  transform-origin: top;
  position: absolute;
  top: 100%;
  width: 100%;
  backface-visibility: hidden;
}
.is_active .button-3d__dropdown {
  transform: rotateX(0deg);
}
.button-3d__dropdown .btn, .button-3d__dropdown .button-slide-out__above {
  background-color: #b24a48;
  transition: background-color 1s linear;
}
.is_active .button-3d__dropdown .btn, .is_active .button-3d__dropdown .button-slide-out__above {
  background-color: #d65a57;
}
.button-3d__dropdown .btn--gray {
  background-color: #7f7f7f;
}
.is_active .button-3d__dropdown .btn--gray {
  background-color: #9c9c9c;
}

.button-slide-out {
  position: relative;
}

.button-slide-out__middle {
  position: relative;
  z-index: 10;
}

.button-slide-out__above,
.button-slide-out__below {
  position: absolute;
  top: 0;
  left: 0;
  z-index: 1;
  width: 100%;
  transition: transform .5s ease;
}

.button-slide-out__above {
  font-size: 14px;
}
.is_active .button-slide-out__above {
  transform: translateY(-100%);
}

.is_active .button-slide-out__below {
  transform: translateY(100%);
}

.button-slide-up {
  position: relative;
  overflow: hidden;
  min-width: 120px;
}
.button-slide-up .button-set {
  margin-top: 0;
}

.button-slide-up__button {
  position: absolute;
  top: 0;
  left: 0;
  transition: transform .5s ease;
}
.is_active .button-slide-up__button {
  transform: translateY(-100%);
}
</style></head><body>
<h1 class="pen-title">Are you sure you want to delete that buttons</h1>

<div class="pen-wrapper">
  <div class="pen-wrapper__inner">
    
    <div class="buton-cover button-3d">
      <button class="btn btn--primary">
        <div class="btn__txt--inactive">Delete</div>
        <div class="btn__txt--active">Are you sure?</div>
      </button>
      <div class="button-3d__dropdown">
        <div class="button-set">
          <button class="btn btn--primary">Delete</button>
          <button class="btn btn--gray">Cancel</button>
        </div>
      </div>
    </div>

  </div>

  <div class="pen-wrapper__inner">
    
    <div class="buton-cover button-slide-out">
      <span class="button-slide-out__above">Are you sure?</span>
      <div class="button-slide-out__middle">
        <button class="btn btn--primary">Delete</button>
      </div>
      <div class="button-slide-out__below">
        <button class="btn btn--gray-drk">Cancel</button>
      </div>
    </div>

  </div>

  <div class="pen-wrapper__inner">
    
    <div class="buton-cover button-slide-up">
      <button class="btn btn--primary button-slide-up__button">Delete</button>
      <div class="button-set">
        <button class="btn btn--gray">Cancel</button>
        <button class="btn btn--gray-drk">Confirm</button>
      </div>
    </div>

  </div>
</div>
<script src='//assets.codepen.io/assets/common/stopExecutionOnTimeout.js?t=1'></script><script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script>;
(function ($) {
    
    $('.btn').on('click', function() {
        $(this).parents('.buton-cover').toggleClass('is_active');
    });
}(jQuery));
//# sourceURL=pen.js
</script>
</body></html>