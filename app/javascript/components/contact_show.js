const setActiveContact = () => {
  const contacts = document.querySelectorAll(".contact");

  contacts.forEach((element) => {
    element.addEventListener("click", (event) => {
      // remove the class active from the other contacts
      contacts.forEach ( (contact) => {
        contact.classList.remove("active-contact");
      });
      // set class active to the selected contact
      element.classList.toggle("active-contact");
    });
  });
};

export { setActiveContact };
