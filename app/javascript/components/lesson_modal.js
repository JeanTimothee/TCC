const lessonModal = function() {
  const lessons = document.querySelectorAll(".btn-lesson-modal");
  const modal = document.querySelector(".modal-content")
  console.log(lessons);
  if (lessons && modal) {
    for (let lesson of lessons) {
      lesson.addEventListener('click', (event) => {
        const studentsList = lesson.dataset.lessonStudents;
        console.log(studentsList);
        console.log(studentsList.json);

        const modalInjection = `<div class="d-flex justify-content-around">
        <h1>C${lesson.dataset.lessonCourt}</h1>
        <h1>${lesson.dataset.lessonTime}</h1>
        <h1>${lesson.dataset.lessonTeacher}</h1>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>`
        modal.innerHTML = modalInjection;
      })
    }
  }
}

export { lessonModal };
