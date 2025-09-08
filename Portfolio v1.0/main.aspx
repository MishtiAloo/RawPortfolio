<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="Portfolio_v1._0.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link
      href="https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=Rajdhani:wght@300;400;500;600;700&display=swap"
      rel="stylesheet"
    />

    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
    />

    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Raw Portfolio</title>
    <link rel="stylesheet" href="main.css" runat="server"/>
    <script src="main.js" defer></script>
</head>
<body>
  <nav class="nav-container">
      <div class="logo">
        <a href="#about">Farhan Tahmid</a>
      </div>

      <div class="navlinks">
        <a href="#about">About</a>
        <a href="#expertise">Expertise</a>
        <a href="#skill-container">Skills</a>
        <a id="nav-project" href="#projects"
          >Projects
          <i
            style="font-size: 1rem; margin-left: 2px"
            class="fa-solid fa-caret-down"
          ></i>
        </a>
        <div id="nav-project-dropdown">
          <a href="#projects">All Projects</a>
          <a href="#projects">Web Development</a>
          <a href="#projects">Android Development</a>
          <a href="#projects">Desktop Development</a>
          <a href="#projects">Machine Learning</a>
        </div>
        <a href="#education">Education</a>
        <a href="#contact">Contact</a>
      </div>

      <div class="nav-toggle">
        <div class="top-ham"></div>
        <div class="mid-ham"></div>
        <div class="bottom-ham"></div>
      </div>

      <div style="overflow-y: auto" class="side-menu" id="sideMenu">
        <button
          id="nav-slider-close"
          style="width: fit-content; margin-left: auto"
        >
          <i style="font-size: 1rem" class="fa-solid fa-xmark"></i>
        </button>

        <div
          style="
            display: flex;
            flex-direction: row;
            flex-wrap: wrap;
            align-items: center;
            justify-content: center;
            gap: 1rem;
          "
        >
          <img
            style="width: 100px; height: 100px"
            src="assets/android.png"
            alt=""
          />
          <p style="font-size: 1.5rem">Farhan Tahmid</p>
        </div>

        <div style="display: flex; flex-direction: column; align-items: center">
          <h2 style="align-self: center; color: #ff014f">Links</h2>
          <div style="width: 80%; height: 2px; background-color: white"></div>
        </div>

        <div
          style="
            display: flex;
            flex-direction: column;
            flex-wrap: wrap;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            font-size: 1rem;
          "
        >
          <a class="animated-links" href="#about">
            <i
              style="font-size: 1rem; margin-right: 3px"
              class="fa-solid fa-user"
            ></i>
            About
          </a>

          <a class="animated-links" href="#expertise">
            <i
              style="font-size: 1rem; margin-right: 3px"
              class="fa-solid fa-lightbulb"
            ></i>
            Expertise
          </a>

          <a class="animated-links" href="#skill-container">
            <i
              style="font-size: 1rem; margin-right: 3px"
              class="fa-solid fa-code"
            ></i>
            Skills
          </a>

          <a class="animated-links" href="#projects">
            <i
              style="font-size: 1rem; margin-right: 3px"
              class="fa-solid fa-diagram-project"
            ></i>
            Projects
          </a>

          <a class="animated-links" href="#education">
            <i
              style="font-size: 1rem; margin-right: 3px"
              class="fa-solid fa-graduation-cap"
            ></i>
            Education
          </a>

          <a class="animated-links" href="#contact">
            <i
              style="font-size: 1rem; margin-right: 3px"
              class="fa-solid fa-envelope"
            ></i>
            Contact
          </a>
        </div>

        <div style="display: flex; flex-direction: column; align-items: center">
          <h2 style="align-self: center; color: #ff014f">Connect With me</h2>
          <div style="width: 80%; height: 2px; background-color: white"></div>
        </div>

        <div
          style="
            display: flex;
            flex-direction: column;
            flex-wrap: wrap;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            font-size: 1.2rem;
          "
        >
          <a class="animated-links" href="#about">
            <i
              style="font-size: 1rem; margin-right: 3px"
              class="fa-solid fa-phone"
            ></i>
            Call Me: 01932323650</a
          >
          <a class="animated-links" href="#contact">
            <i
              style="font-size: 1rem; margin-right: 3px"
              class="fa-solid fa-envelope"
            ></i>
            Mail Me: f.tahmid123@gmail.com</a
          >

          <a class="animated-links" href="https://github.com/MishtiAloo">
            <i
              style="font-size: 1rem; margin-right: 3px"
              class="fa-solid fa-code-branch"
            ></i>
            Github
          </a>

          <a class="animated-links" href="https://linkedin.com/in/farhan-tahmid-100387332">
            <i
              style="font-size: 1rem; margin-right: 3px"
              class="fa-solid fa-arrow-up-right-from-square"
            ></i>
            LinkedIn
          </a>
        </div>
        <button type="button" onclick="window.location.href='login.aspx'">
            Admin Login
        </button>

      </div>

      <!-- Overlay -->
      <div class="menu-overlay" id="menuOverlay"></div>
    </nav>

    <main>
      <section id="profile" class="slide-in">
        <div class="profile-image-container">
          <img
            src="https://plus.unsplash.com/premium_photo-1686257809551-9d11dd3b2625?q=80&w=645&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
            alt="Profile Picture"
            class="profile-image"
          />
          <div class="blur-overlay">
            <div class="profile-info">
              <p style="font-size: 2rem; margin-bottom: -2rem">Hello</p>
              <p style="font-size: 4rem">I am Farhan Tahmid</p>
              <p style="font-size: 2rem; padding-bottom: 1rem">
                I am <span id="role" style="color: #ff014f; display: inline-block; white-space: nowrap;"></span>
              </p>
              <p style="width: 60%; padding-bottom: 1rem">
                I am a passionate Computer Science and Engineering undergraduate exploring the MERN stack, 
                Android development with Java, and the exciting field of AI/ML. 
                  I enjoy transforming ideas into practical solutions, whether it’s building responsive 
                  web applications, mobile apps, or database-driven systems. My interests lie in creating projects that not only 
                  work efficiently but also make a real-world impact. I am always open to collaboration, 
                  new challenges, and opportunities to grow as a developer and innovator.
              </p>
            <a href="assets/Farhan Tahmid CV-main.pdf" target="_blank" rel="noopener noreferrer">
              <button>
                See my CV
                <i class="fa-solid fa-arrow-right" style="font-size: 1em; margin-left: 0.5rem"></i>
              </button>
            </a>
            </div>
          </div>
        </div>
      </section>

      <section id="expertise" class="mini-sections slide-in">
        <h1>Experties</h1>
        <div class="expertise-section">
          <div class="expertise-item">
            <i class="fa-solid fa-globe"></i>
            <h2 class="animated-links">Web Development</h2>
            <p>2 projects</p>
          </div>
          <div class="expertise-item">
            <i class="fa-solid fa-screwdriver-wrench"></i>
            <h2 class="animated-links">Programming</h2>
            <p>2 projects</p>
          </div>
          <div class="expertise-item">
            <i class="fa-solid fa-mobile-screen"></i>
            <h2 class="animated-links">Android Development</h2>
            <p>1 projects</p>
          </div>
          <div class="expertise-item">
            <i class="fa-solid fa-network-wired"></i>
            <h2 class="animated-links">Machine Learning</h2>
            <p>0 projects</p>
          </div>
        </div>
      </section>

      <section id="about" class="slide-in">
        <h1>About Me</h1>
        <p>
          I am a Computer Science and Engineering undergraduate with a strong interest 
          in building practical and impactful solutions. I have experience working with 
          the MERN stack, Android development (Java), and database-driven projects.
        </p>
        <p>
          I am currently exploring Artificial Intelligence and Machine Learning, while 
          also strengthening my skills in software design and full-stack development. 
          I enjoy turning ideas into real-world applications that solve meaningful problems.
        </p>
        <p>
          Feel free to connect with me if you’d like to discuss technology, collaborate 
          on projects, or share innovative ideas.
        </p>

      </section>

      <section id="skill-container" class="mini-sections">
        <h1>Skills</h1>
        <div class="skill-set slide-in">
          <h2>Web Dev Frontend</h2>
          <div class="skill-item">
            <img src="assets/html.jpg" alt="" />
            <p>HTML</p>
          </div>
          <div class="skill-item">
            <img src="assets/css-3.png" alt="" />
            <p>CSS</p>
          </div>
          <div class="skill-item">
            <img src="assets/java-script.png" alt="" />
            <p>JavaScript</p>
          </div>
          <div class="skill-item">
            <img src="assets/tailwind.png" alt="" />
            <p>Tailwind</p>
          </div>
          <div class="skill-item">
            <img src="assets/react.png" alt="" />
            <p>React</p>
          </div>
          <div class="skill-item">
            <img src="assets/figma.png" alt="" />
            <p>Figma</p>
          </div>
        </div>
        <div class="skill-set slide-in">
          <h2>Web Dev Backend</h2>
          <div class="skill-item">
            <img src="assets/nodejs.png" alt="" />
            <p>Node.js</p>
          </div>
          <div class="skill-item">
            <img src="assets/mongo-db.png" alt="" />
            <p>MongoDB</p>
          </div>
        </div>
        <div class="skill-set slide-in">
          <h2>Language</h2>
          <div class="skill-item">
            <img src="assets/letter-c.png" alt="" />
            <p>C</p>
          </div>
          <div class="skill-item">
            <img src="assets/cp.png" alt="" />
            <p>C++</p>
          </div>
          <div class="skill-item">
            <img src="assets/java.png" alt="" />
            <p>Java</p>
          </div>
          <div class="skill-item">
            <img src="assets/java-script.png" alt="" />
            <p>JavaScript</p>
          </div>
          <div class="skill-item">
            <img src="assets/python.png" alt="" />
            <p>Python</p>
          </div>
          <div class="skill-item">
            <img src="assets/shell.png" alt="" />
            <p>Shell</p>
          </div>
        </div>
        <div class="skill-set slide-in">
          <h2>Machine Learning</h2>
          <div class="skill-item">
            <img src="assets/python.png" alt="" />
            <p>Python</p>
          </div>
          <div class="skill-item">
            <img src="assets/scikit.png" alt="" />
            <p>SciKitLearn</p>
          </div>
          <div class="skill-item">
            <img src="assets/pandas.png" alt="" />
            <p>Pandas</p>
          </div>
          <div class="skill-item">
            <img src="assets/numpy.png" alt="" />
            <p>Numpy</p>
          </div>
          <div class="skill-item">
            <img src="assets/matplot.png" alt="" />
            <p>MatplotLib</p>
          </div>
        </div>
        <div class="skill-set slide-in">
          <h2>Android & Desktop App Dev</h2>
          <div class="skill-item">
            <img src="assets/jfx.png" alt="" />
            <p>JavaFX</p>
          </div>
          <div class="skill-item">
            <img src="assets/sbuilder.png" alt="" />
            <p>Scenebuilber</p>
          </div>
          <div class="skill-item">
            <img src="assets/intellij.png" alt="" />
            <p>Intellij</p>
          </div>
          <div class="skill-item">
            <img src="assets/android.png" alt="" />
            <p>AndroidStudio</p>
          </div>
          <div class="skill-item">
            <img src="assets/sql.png" alt="" />
            <p>SQL</p>
          </div>
        </div>
        <div class="skill-set slide-in">
          <h2>Tools</h2>
          <div class="skill-item">
            <img src="assets/vsc.png" alt="" />
            <p>VSCode</p>
          </div>
          <div class="skill-item">
            <img src="assets/postman.png" alt="" />
            <p>Postman</p>
          </div>
          <div class="skill-item">
            <img src="assets/wsl.png" alt="" />
            <p>WSL</p>
          </div>
          <div class="skill-item">
            <img src="assets/github.png" alt="" />
            <p>Git</p>
          </div>
        </div>
      </section>

      <section id="education" class="mini-sections slide-in">
        <h1>Education</h1>
        <div class="edu-container">
          <div class="edu-row slide-in">
            <div class="edu-item shimmer" style="align-self: flex-start">
              <h2 class="animated-links">
                BSC Engg. in Computer Science and Engineering
              </h2>
              <p>Khulna University of Engineering & Technology</p>
              <p
                style="font-style: italic; font-weight: 300; font-size: 1.1rem"
              >
                Graduation: 2026 (estimated)
              </p>
              <p style="color: rgb(209, 181, 27); font-size: 1.5rem">
                Current CGPA: 3.81
              </p>
            </div>

            <div
              style="
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 1.2rem;
              "
            >
              <img
                src="assets/kuetLogo.png"
                alt=""
                style="width: 8rem; height: 8rem"
              />
              <p>2022-20XX</p>
            </div>
          </div>
          <div class="edu-row slide-in" style="justify-content: space-between">
            <div
              style="
                display: flex;
                align-items: center;
                font-size: 1.2rem;
                margin-left: auto;
              "
            >
              <p>2019-2021</p>
              <img
                src="assets/kuetLogo.png"
                alt=""
                style="width: 8rem; height: 8rem"
              />
            </div>

            <div class="edu-item shimmer">
              <h2 class="animated-links">
                HSC in Science
              </h2>
              <p>Dhaka College</p>
              <p
                style="font-style: italic; font-weight: 300; font-size: 1.1rem"
              >
                Passed: 2021
              </p>
              <p style="color: rgb(209, 181, 27); font-size: 1.5rem">
                GPA: 5.00
              </p>
            </div>
          </div>
          <div class="edu-row slide-in">
            <div class="edu-item shimmer" style="align-self: flex-start">
              <h2 class="animated-links">
                SSC in Science
              </h2>
              <p>Dhanmondi Govt. Boys' High School</p>
              <p
                style="font-style: italic; font-weight: 300; font-size: 1.1rem"
              >
                Passed: 2019
              </p>
              <p style="color: rgb(209, 181, 27); font-size: 1.5rem">
                GPA: 5.00
              </p>
            </div>

            <div
              style="
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 1.2rem;
              "
            >
              <img
                src="assets/kuetLogo.png"
                alt=""
                style="width: 8rem; height: 8rem"
              />
              <p>2018-2019</p>
            </div>
          </div>
        </div>
      </section>

      <section id="certificate" class="mini-sections slide-in">
    <h1>Certificates</h1>
    <div class="cert-container">
        <asp:Repeater ID="rptCertificates" runat="server">
            <ItemTemplate>
                <div class="cert-item">
                    <img src='<%# Eval("ImageUrl") %>' alt="Certificate Image" />
                    <div class="cert-details">
                        <h2><%# Eval("Title") %></h2>
                        <p class="cert-info"><%# Eval("Description") %></p>
                        <p>Issued on: <span><%# Eval("IssuedOn", "{0:dd MMM, yyyy}") %></span></p>
                        <p>Issued by: <span><%# Eval("IssuedBy") %></span></p>
                        <p>Tags: <span><%# Eval("Tags") %></span></p>
                        <div style="display: flex; flex-direction: row; justify-content: flex-end; gap: 1rem; margin-top: 1.5rem;">
                            <button>Show</button>
                            <button><a href='<%# Eval("CertificateLink") %>' target="_blank">Cert Link</a></button>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</section>


      <section id="projects" class="mini-sections slide-in">
        <h1>Projects</h1>
        <div class="project-filter-container slide-in">
           <div class="project-filter-slider"></div>
          <div>
            <i class="fa-solid fa-filter"></i>
            <span class="animated-links">All</span>
          </div>
          <div>
            <i class="fa-solid fa-globe"></i>
            <span class="animated-links">Web Development</span>
          </div>
          <div>
            <i class="fa-solid fa-mobile-screen"></i>
            <span class="animated-links">Android</span>
          </div>
          <div>
            <i class="fa-solid fa-desktop"></i>
            <span class="animated-links">Desktop</span>
          </div>
          <div>
            <i class="fa-solid fa-circle-nodes"></i>
            <span class="animated-links">Other</span>
          </div>
        </div>
<asp:Repeater ID="rptProjects" runat="server" OnItemDataBound="rptProjects_ItemDataBound">
    <ItemTemplate>
        <div class="project-container slide-in">
            <div class="project-image-container">
                <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Title") %>' />
                <div class="project-tag">
                    <i class="fa-solid fa-globe"></i>
                    <span><%# Eval("Tags") %></span>
                </div>
            </div>
            <div class="project-details">
                <h1><%# Eval("Title") %></h1>
                <p><%# Eval("Description") %></p>
                <div id="StacksContainer" runat="server" class="used-stack-container"></div>
                <div class="button-links">
                    <a href='<%# Eval("GithubLink") %>'>
                        <i class="fa-brands fa-github"></i>
                        <span>Code</span>
                    </a>
                    <a href='<%# Eval("WebsiteLink") %>'>
                        <i class="fa-solid fa-globe"></i>
                        <span>Website</span>
                    </a>
                </div>
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>

      </section>

      <section id="contact" class="mini-sections slide-in">
        <h1>Contact</h1>
        <div class="contact-row slide-in">
          <div class="contact-column">
            <h2>
              Wanna talk over some
              <span style="color: #ff014f; font-size: 2rem; margin-left: 1rem"
                >Coffe/Tea?</span
              >
            </h2>
            <p>
              Choose freely. <span style="color: #ff014f">It's on me....</span>
            </p>
            <div class="coffee-tea">
              <img src="assets/coffee-1.png" alt="" />
              <img src="assets/tea.png" alt="" />
            </div>
          </div>
<div class="contact-column">
  <form id="contactForm" style="display: flex; flex-direction: column; align-items: center">
    <div style="display: flex; flex-direction: row; justify-content: space-between;">
      <input
        type="text"
        id="txtName"
        placeholder="Your Name"
        required
      />
      <input
        type="email"
        id="txtEmail"
        placeholder="Your Email"
        required
      />
    </div>
    <textarea
      id="txtMessage"
      cols="30"
      rows="10"
      placeholder="Your Message"
      required
      style="width: 100%"
    ></textarea>
    <button style="width: fit-content" type="submit" id="btnSend">
      Send Message
    </button>
  </form>
</div>

        </div>

        <div
          style="
            width: 100%;
            background-color: #ff014f;
            height: 3px;
            margin: 2rem 0;
          "
        ></div>

        <div class="contact-row slide-in">
          <div class="contact-column">
            <h2 style="color: #ff014f; font-size: 2.3rem">My Officials</h2>
            <div
              style="
                width: 100%;
                background-color: aliceblue;
                height: 2px;
                margin: 1rem 5rem;
              "
            ></div>
            <a href="https://github.com/MishtiAloo">
              <div class="social-links">
                <img src="assets/github.png" alt="" />
                <p class="animated-links">Github Profile</p>
              </div>
            </a>
            <a href="https://www.linkedin.com/in/farhan-tahmid-100387332/">
              <div class="social-links">
                <img src="assets/linkedin-logo.png" alt="" />
                <p class="animated-links">LinkedIn Profile</p>
              </div>
            </a>
            <a href="https://codeforces.com/profile/XiliamRed">
              <div class="social-links">
                <img src="assets/code-forces.png" alt="" />
                <p class="animated-links">CodeForces</p>
              </div>
            </a>
            <a href="https://iconscout.com/all-assets/call">
              <div class="social-links">
                <img src="assets/leetcode.png" alt="" />
                <p class="animated-links">LeetCode Profile</p>
              </div>
            </a>
            <a href="https://www.kaggle.com/mishtialoo">
              <div class="social-links">
                <img src="assets/kaggle.png" alt="" />
                <p class="animated-links">Kaggle Profile</p>
              </div>
            </a>
          </div>
          <div class="contact-column">
            <h2 style="color: #ff014f; font-size: 2.3rem">My Socials</h2>
            <div
              style="
                width: 100%;
                background-color: aliceblue;
                height: 2px;
                margin: 1rem 5rem;
              "
            ></div>
            <a href="#">
              <div class="social-links">
                <img src="assets/Phone.png" alt="" />
                <p class="animated-links">01932323650</p>
              </div>
            </a>
            <a href="https://www.facebook.com/farhan.tahmid.9210/">
              <div class="social-links">
                <img src="assets/facebook-logo.png" alt="" />
                <p class="animated-links">Facebook</p>
              </div>
            </a>
            <a href="https://www.instagram.com/qing_of_spades/">
              <div class="social-links">
                <img src="assets/instagram-logo.png" alt="" />
                <p class="animated-links">Instagram</p>
              </div>
            </a>
            <a href="#">
              <div class="social-links">
                <img src="assets/whatsapp-logo.png" alt="" />
                <p class="animated-links">WhatsApp</p>
              </div>
            </a>
            <a href="#">
              <div class="social-links">
                <img src="assets/telegram-logo.png" alt="" />
                <p class="animated-links">Telegram</p>
              </div>
            </a>
          </div>
        </div>
      </section>
    </main>

    <footer class="mini-sections">
      <p>&copy; 2023 Farhan Tahmid</p>
    </footer>

    <script type="text/javascript"
            src="https://cdn.jsdelivr.net/npm/@emailjs/browser@4/dist/email.min.js">
    </script>
    <script type="text/javascript">
        (function () {
            emailjs.init({
                publicKey: "Q6_WdLeBMSoeXT2IZ",
            });
        })();
    </script>

</body>
</html>
