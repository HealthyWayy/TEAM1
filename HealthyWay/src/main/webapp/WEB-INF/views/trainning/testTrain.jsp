<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/css/test_train.css">
<div>사이드 레터럴 레이즈</div>
<script type="text/javascript" language="JavaScript">
	function hideDiv (){
		document.getElementById("hideVideo").style.display="none";
	}
	self.setTimeout("hideDiv()",5000); // 초 지정
</script>
<div id="hideVideo">
	<video class="ready-video" src="/train_model/countdown5s.mp4" autoplay muted style="width:100%; heigth:100%; margin: 0 auto;"></video>
</div>
<!-- <button type="button" onclick="init()">시작하기</button> -->
<div><canvas id="canvas"></canvas></div>
<div id="label-container"></div>
<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@teachablemachine/pose@0.8/dist/teachablemachine-pose.min.js"></script>
<script type="text/javascript">
    // More API functions here:
    // https://github.com/googlecreativelab/teachablemachine-community/tree/master/libraries/pose

    // the link to your model provided by Teachable Machine export panel
    const URL = "/train_model/moduleImg/";
    let model, webcam, ctx, labelContainer, maxPredictions;

    async function init() {
        const modelURL = URL + "model.json";
        const metadataURL = URL + "metadata.json";

        // load the model and metadata
        // Refer to tmImage.loadFromFiles() in the API to support files from a file picker
        // Note: the pose library adds a tmPose object to your window (window.tmPose)
        model = await tmPose.load(modelURL, metadataURL);
        maxPredictions = model.getTotalClasses();

        // Convenience function to setup a webcam
        const size = 600;
        const flip = true; // whether to flip the webcam
        webcam = new tmPose.Webcam(size, size, flip); // width, height, flip
        await webcam.setup(); // request access to the webcam
        await webcam.play();
        window.requestAnimationFrame(loop);

        // append/get elements to the DOM
        const canvas = document.getElementById("canvas");
        canvas.width = size; canvas.height = size;
        ctx = canvas.getContext("2d");
        labelContainer = document.getElementById("label-container");
        for (let i = 0; i < maxPredictions; i++) { // and class labels
            labelContainer.appendChild(document.createElement("div"));
        }
    }

    async function loop(timestamp) {
        webcam.update(); // update the webcam frame
        await predict();
        window.requestAnimationFrame(loop);
    }
    var count = 0;
    var status = "one";
    async function predict() {
        // Prediction #1: run input through posenet
        // estimatePose can take in an image, video or canvas html element
        const { pose, posenetOutput } = await model.estimatePose(webcam.canvas);
        // Prediction 2: run input through teachable machine classification model
        const prediction = await model.predict(posenetOutput);

        var p1 = prediction[0].probability.toFixed(2);
        var p2 = prediction[1].probability.toFixed(2);
        var p3 = prediction[2].probability.toFixed(2);
        
       //two에서 one이 돼야 운동 한 거
        if (p1 == 1.0){   //어깨접기
           if(status=="two"){
              count++;
              console.log(count);
           }
              status = "one";
        }else if(p2==1.0){//앞으로
           status = "two";
        }else if(p3==1.0){
           status = "three";
           console.log("자세 제대로 해");
        }
        
        for (let i = 0; i < maxPredictions; i++) {
            const classPrediction =
                prediction[i].className + ": " + prediction[i].probability.toFixed(2);
            labelContainer.childNodes[i].innerHTML = classPrediction;
        }

        // finally draw the poses
        drawPose(pose);
    }

    function drawPose(pose) {
        if (webcam.canvas) {
            ctx.drawImage(webcam.canvas, 0, 0);
            // draw the keypoints and skeleton 키포인트와 골격을 그려줌
            if (pose) {
                const minPartConfidence = 0.5;
                tmPose.drawKeypoints(pose.keypoints, minPartConfidence, ctx);
                tmPose.drawSkeleton(pose.keypoints, minPartConfidence, ctx);
            }
        }
    }
    setTimeout(() => {
        init()
    }, 4000);
    // init();
</script>
    <P id="display"></P>
    영상 띄워 놓는곳
    <video src="/train_model/moduleImg/pront_raise.mp4" autoplay controls loop muted style="float:left">
        tmp
    </video>
    
