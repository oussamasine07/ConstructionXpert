
    <%@ page import="com.ConstructionXpert.model.Project, java.util.*, com.ConstructionXpert.dto.*" %>

    <%


    %>

    <jsp:include page="/views/parcials/header.jsp" />

        <div class="p-4 mx-auto max-w-screen-2xl md:p-6">
            <!-- Breadcrumb Start -->
              <div x-data="{ pageName: `Basic Tables`}">
                <div class="mb-6 flex flex-wrap items-center justify-between gap-3">
                  <h2 class="text-xl font-semibold text-gray-800 dark:text-white/90">New Project</h2>

                  <nav>
                    <ol class="flex items-center gap-1.5">
                      <li>
                        <a class="inline-flex items-center gap-1.5 text-sm text-gray-500 dark:text-gray-400"
                          href="${pageContext.request.contextPath}">
                          Home
                          <svg class="stroke-current" width="17" height="16" viewBox="0 0 17 16" fill="none"
                            xmlns="http://www.w3.org/2000/svg">
                            <path d="M6.0765 12.667L10.2432 8.50033L6.0765 4.33366" stroke="" stroke-width="1.2"
                              stroke-linecap="round" stroke-linejoin="round" />
                          </svg>
                        </a>
                      </li>
                      <li class="text-sm text-gray-800 dark:text-white/90">new project</li>
                    </ol>
                  </nav>
                </div>
              </div>
              <!-- Breadcrumb End -->

              <div class="rounded-2xl border border-gray-200 bg-white dark:border-gray-800 dark:bg-white/[0.03]">
                  <div class="px-5 py-4 sm:px-6 sm:py-5">
                    <h3 class="text-base font-medium text-gray-800 dark:text-white/90">
                      Project
                    </h3>
                  </div>

                  <div class="space-y-6 border-t border-gray-100 p-5 sm:p-6 dark:border-gray-800">
                    <!-- Elements -->
                    <form action="${pageContext.request.contextPath}/project/create" method="POST">

                          <label class="mb-1.5 block text-sm font-medium text-gray-700 dark:text-gray-400">
                            Name
                          </label>
                          <div class="relative">
                            <input type="text" value="" name="name" placeholder="Enter resource name" class="dark:bg-dark-900 shadow-theme-xs focus:border-brand-300 focus:ring-brand-500/10 dark:focus:border-brand-800 h-11 w-full rounded-lg border border-gray-300 bg-transparent px-4 py-2.5 text-sm text-gray-800 placeholder:text-gray-400 focus:ring-3 focus:outline-hidden dark:border-gray-700 dark:bg-gray-900 dark:text-white/90 dark:placeholder:text-white/30" />
                          </div>
                            <%-- <% if (errors != null && errors.containsKey("name")) { %>
                                <p class="text-theme-xs text-error-500 mt-1.5">
                                    <%= errors.get("name") %>
                                </p>
                            <% } %> --%>
                        </div>

                        <div>
                            <button type="submit" class="py-2 px-4 bg-blue-400 text-gray-700 dark:text-white" >Create Project</button>
                        </div>
                    </form>
                  </div>
                </div>
        </div>

    <jsp:include page="/views/parcials/footer.jsp" />