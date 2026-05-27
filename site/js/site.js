(function () {
  const content = document.querySelector(".content.prose");
  const toc = document.getElementById("toc");
  if (!content || !toc) return;

  const headings = content.querySelectorAll("h2");
  if (!headings.length) return;

  const ul = document.createElement("ul");

  headings.forEach((heading, index) => {
    const id = heading.id || "sec-" + index;
    heading.id = id;

    const li = document.createElement("li");
    const a = document.createElement("a");
    a.href = "#" + id;
    a.textContent = heading.textContent;
    li.appendChild(a);
    ul.appendChild(li);
  });

  toc.appendChild(ul);

  const links = toc.querySelectorAll("a");
  const observer = new IntersectionObserver(
    (entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          links.forEach((link) => {
            link.classList.toggle(
              "is-active",
              link.getAttribute("href") === "#" + entry.target.id
            );
          });
        }
      });
    },
    { rootMargin: "-20% 0% -70% 0%", threshold: 0 }
  );

  headings.forEach((h) => observer.observe(h));
})();
