const showAddNoteForm = () => {
  const noteForm = document.getElementById("note-form");
  const linkAddNote = document.getElementById("link-add-note");
  linkAddNote.addEventListener("click", (event) => {
    event.preventDefault();
    noteForm.classList.remove("hidden");
  });
};

export{ showAddNoteForm };
