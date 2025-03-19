
    <%@ page import="com.ConstructionXpert.model.Task, java.util.*" %>
    <%
        List<Task> tasks = (List<Task>) request.getAttribute("tasks");
        int projectId = Integer.parseInt(request.getParameter("projectId"));

    %>
    <jsp:include page="/views/parcials/header.jsp" />

        <div class="p-4 mx-auto max-w-screen-2xl md:p-6">
            <!-- Breadcrumb Start -->
              <div x-data="{ pageName: `Basic Tables`}">
                <div class="mb-6 flex flex-wrap items-center justify-between gap-3">
                  <h2 class="text-xl font-semibold text-gray-800 dark:text-white/90">List of all tasks</h2>

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
                      <li class="text-sm text-gray-800 dark:text-white/90">tasks</li>
                    </ol>
                  </nav>
                </div>
              </div>
              <!-- Breadcrumb End -->

              <div class="space-y-5 sm:space-y-6">
                  <div class="rounded-2xl border border-gray-200 bg-white dark:border-gray-800 dark:bg-white/[0.03]">
                    <div class="px-5 py-4 sm:px-6 sm:py-5 flex justify-between items-center">
                      <h3 class="text-base font-medium text-gray-800 dark:text-white/90">
                        Tasks
                      </h3>

                      <a href="${pageContext.request.contextPath}/tasks/create?prjectId=<%= projectId %>" class="px-6 py-3 bg-gradient-to-r from-green-500 to-green-700 text-white font-semibold rounded-lg shadow-md hover:from-green-600 hover:to-green-800 transition-all duration-300 flex items-center gap-2">
                          <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                              <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4"></path>
                          </svg>
                          Create Task
                      </a>
                    </div>
                    <div class="p-5 border-t border-gray-100 dark:border-gray-800 sm:p-6">
                      <!-- ====== Table Six Start -->
                      <div
                        class="overflow-hidden rounded-xl border border-gray-200 bg-white dark:border-gray-800 dark:bg-white/[0.03]">
                        <div class="max-w-full overflow-x-auto">
                          <table class="min-w-full">
                            <!-- table header start -->
                            <thead>
                              <tr class="border-b border-gray-100 dark:border-gray-800">
                                <th class="px-5 py-3 sm:px-6">
                                  <div class="flex items-center">
                                    <p class="font-medium text-gray-500 text-theme-xs dark:text-gray-400">
                                      Name
                                    </p>
                                  </div>
                                </th>
                                <th class="px-5 py-3 sm:px-6">
                                  <div class="flex items-center">
                                    <p class="font-medium text-gray-500 text-theme-xs dark:text-gray-400">
                                      Start date
                                    </p>
                                  </div>
                                </th>
                                <th class="px-5 py-3 sm:px-6">
                                  <div class="flex items-center">
                                    <p class="font-medium text-gray-500 text-theme-xs dark:text-gray-400">
                                      End date
                                    </p>
                                  </div>
                                </th>
                                <th class="px-5 py-3 sm:px-6">
                                  <div class="flex items-center">
                                    <p class="font-medium text-gray-500 text-theme-xs dark:text-gray-400">
                                      Actions
                                    </p>
                                  </div>
                                </th>
                              </tr>
                            </thead>
                            <!-- table header end -->
                            <!-- table body start -->
                            <tbody class="divide-y divide-gray-100 dark:divide-gray-800">

                                <% for (Task task : tasks ) { %>
                                    <tr>
                                        <td class="px-5 py-4 sm:px-6">
                                          <div class="flex items-center">
                                            <p class="text-gray-500 text-theme-sm dark:text-gray-200">
                                                <a href="${pageContext.request.contextPath}/tasks/update?projectId=<%= task.getProject().getProjectId() %>&taskId=<%= task.getTaskId() %>">
                                                    <%= task.getName() %>
                                                </a>
                                            </p>
                                          </div>
                                        </td>
                                        <td class="px-5 py-4 sm:px-6">
                                          <div class="flex items-center">
                                            <p class="text-gray-500 text-theme-sm dark:text-gray-200">
                                              <%= task.getStartDate() %>
                                            </p>
                                          </div>
                                        </td>
                                        <td class="px-5 py-4 sm:px-6">
                                          <div class="flex items-center">
                                            <p class="text-gray-500 text-theme-sm dark:text-gray-200">
                                              <%= task.getEndDate() %>
                                            </p>
                                          </div>
                                        </td>

                                        <td class="px-5 py-4 sm:px-6">
                                          <div class="flex items-center">
                                            <a href="${pageContext.request.contextPath}/tasks/update?projectId=<%= task.getProject().getProjectId() %>&taskId=<%= task.getTaskId() %>">edit</a>
                                            <form action="${pageContext.request.contextPath}/tasks/delete?projectId=<%= task.getProject().getProjectId() %>&taskId=<%= task.getTaskId() %>" method="POST">
                                                <button type="sumbmit">delete</button>
                                            </form>
                                          </div>
                                        </td>
                                      </tr>
                                <% } %>


                            </tbody>
                          </table>
                        </div>
                      </div>
                      <!-- ====== Table Six End -->
                    </div>
                  </div>
                </div>
        </div>

    <jsp:include page="/views/parcials/footer.jsp" />