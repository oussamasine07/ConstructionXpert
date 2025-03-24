<%@ page import="com.ConstructionXpert.model.Project, java.util.*" %>
<%
    List<Project> projects = (List<Project>) request.getAttribute("projects");

%>
<jsp:include page="/views/parcials/header.jsp"/>

<div class="p-4 mx-auto max-w-screen-2xl md:p-6">
    <!-- Breadcrumb Start -->
    <div x-data="{ pageName: `Basic Tables`}">
        <div class="mb-6 flex flex-wrap items-center justify-between gap-3">
            <h2 class="text-xl font-semibold text-gray-800 dark:text-white/90">List of all projects</h2>

            <nav>
                <ol class="flex items-center gap-1.5">
                    <li>
                        <a class="inline-flex items-center gap-1.5 text-sm text-gray-500 dark:text-gray-400"
                           href="${pageContext.request.contextPath}">
                            Home
                            <svg class="stroke-current" width="17" height="16" viewBox="0 0 17 16" fill="none"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path d="M6.0765 12.667L10.2432 8.50033L6.0765 4.33366" stroke="" stroke-width="1.2"
                                      stroke-linecap="round" stroke-linejoin="round"/>
                            </svg>
                        </a>
                    </li>
                    <li class="text-sm text-gray-800 dark:text-white/90">projects</li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <div class="space-y-5 sm:space-y-6">
        <div class="rounded-2xl border border-gray-200 bg-white dark:border-gray-800 dark:bg-white/[0.03]">
            <div class="px-5 py-4 sm:px-6 sm:py-5 flex justify-between items-center">
                <h3 class="text-base font-medium text-gray-800 dark:text-white/90">
                    All projects
                </h3>

                <a href="${pageContext.request.contextPath}/project/create"
                   class="px-6 py-2 bg-gradient-to-r from-green-500 to-green-700 text-white font-semibold rounded-lg shadow-md hover:from-green-600 hover:to-green-800 transition-all duration-300 flex items-center gap-2">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"
                         xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4"></path>
                    </svg>
                    Create Project
                </a>
            </div>
            <div class="p-5 border-t border-gray-100 dark:border-gray-800 sm:p-6">
                <!-- ====== Table Six Start -->
                <div class="overflow-hidden rounded-xl border border-gray-200 bg-white dark:border-gray-800 dark:bg-white/[0.03]">
                    <div class="max-w-full overflow-x-auto">
                        <table class="min-w-full">
                            <!-- table header start -->
                            <thead>
                            <tr class="border-b border-gray-100 dark:border-gray-800">
                                <th class="px-5 py-3 sm:px-6">
                                    <div class="flex items-center">
                                        <p class="font-bold text-gray-500 text-theme-sm dark:text-white/90">
                                            Name
                                        </p>
                                    </div>
                                </th>
                                <th class="px-5 py-3 sm:px-6">
                                    <div class="flex items-center">
                                        <p class="font-bold text-gray-500 text-theme-sm dark:text-white/90">
                                            Stat date
                                        </p>
                                    </div>
                                </th>
                                <th class="px-5 py-3 sm:px-6">
                                    <div class="flex items-center">
                                        <p class="font-bold text-gray-500 text-theme-sm dark:text-white/90">
                                            End date
                                        </p>
                                    </div>
                                </th>
                                <th class="px-5 py-3 sm:px-6">
                                    <div class="flex items-center">
                                        <p class="font-bold text-gray-500 text-theme-sm dark:text-white/90">
                                            Budget
                                        </p>
                                    </div>
                                </th>
                                <th class="px-5 py-3 sm:px-6">
                                    <div class="flex items-center">
                                        <p class="font-bold text-gray-500 text-theme-sm dark:text-white/90">
                                            Actions
                                        </p>
                                    </div>
                                </th>
                            </tr>
                            </thead>
                            <!-- table header end -->
                            <!-- table body start -->
                            <tbody class="divide-y divide-gray-100 dark:divide-gray-800">

                            <% for (Project proj : projects) { %>
                            <tr>
                                <td class="px-5 py-4 sm:px-6">
                                    <div class="flex items-center">
                                        <p class="text-gray-500 text-theme-sm dark:text-white/80">
                                            <a href="${pageContext.request.contextPath}/tasks?projectId=<%= proj.getProjectId() %>">
                                                <%= proj.getName() %>
                                            </a>
                                        </p>
                                    </div>
                                </td>
                                <td class="px-5 py-4 sm:px-6">
                                    <div class="flex items-center">
                                        <p class="text-gray-500 text-theme-sm dark:text-white/80">
                                            <%= proj.getStartDate() %>
                                        </p>
                                    </div>
                                </td>
                                <td class="px-5 py-4 sm:px-6">
                                    <div class="flex items-center">
                                        <p class="text-gray-500 text-theme-sm dark:text-white/80">
                                            <%= proj.getEndDate() %>
                                        </p>
                                    </div>
                                </td>
                                <td class="px-5 py-4 sm:px-6">
                                    <div class="flex items-center">
                                        <p class="text-gray-500 text-theme-sm dark:text-white/80">
                                            <%= proj.getBudget() %>
                                        </p>
                                    </div>
                                </td>

                                <td class="px-5 py-4 sm:px-6">
                                    <div class="flex items-center">
                                        <a href="${pageContext.request.contextPath}/project/update?id=<%= proj.getProjectId() %>" class="block px-4 py-1 text-white bg-warning-500 hover:bg-warning-200 focus:ring-2 focus:ring-blue-300 rounded-lg shadow-md transition-all mr-2">
                                            <i class="fa-solid fa-pencil"></i>
                                        </a>
                                        <form action="${pageContext.request.contextPath}/project/delete?id=<%= proj.getProjectId() %>"
                                              method="POST">
                                            <button type="sumbmit" class="block px-4 py-1 text-white bg-error-500 hover:bg-error-200 focus:ring-2 focus:ring-error-300 rounded-lg shadow-md transition-all">
                                                <i class="fa-solid fa-trash"></i>
                                            </button>
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

<jsp:include page="/views/parcials/footer.jsp"/>