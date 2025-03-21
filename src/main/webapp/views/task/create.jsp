<%@ page import="com.ConstructionXpert.model.Project, java.util.*, com.ConstructionXpert.dto.*" %>
<%@ page import="com.ConstructionXpert.model.Resource" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>

<%
    Map<String, String> errors = (Map<String, String>) session.getAttribute("errors");
    session.removeAttribute("errors");

    TaskDTO old = (TaskDTO) session.getAttribute("old");
    session.removeAttribute("old");

    List<Resource> resources = (List<Resource>) request.getAttribute("resources");

    String oldResources = (String) session.getAttribute("oldResources");
    session.removeAttribute("oldResources");

    int projectId = Integer.parseInt(request.getParameter("projectId"));


%>

<jsp:include page="/views/parcials/header.jsp"/>

<div class="p-4 mx-auto max-w-screen-2xl md:p-6">
    <!-- Breadcrumb Start -->
    <div x-data="{ pageName: `Basic Tables`}">
        <div class="mb-6 flex flex-wrap items-center justify-between gap-3">
            <h2 class="text-xl font-semibold text-gray-800 dark:text-white/90">New Task</h2>

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
                    <li class="text-sm text-gray-800 dark:text-white/90">new task</li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <% if ( oldResources != null ) { %>
        <div class="rounded-xl border border-error-500 bg-error-50 p-4 mb-5 dark:border-error-500/30 dark:bg-error-500/15">
            <div class="flex items-start gap-3">
                <div class="-mt-0.5 text-error-500">
                    <svg class="fill-current" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M20.3499 12.0004C20.3499 16.612 16.6115 20.3504 11.9999 20.3504C7.38832 20.3504 3.6499 16.612 3.6499 12.0004C3.6499 7.38881 7.38833 3.65039 11.9999 3.65039C16.6115 3.65039 20.3499 7.38881 20.3499 12.0004ZM11.9999 22.1504C17.6056 22.1504 22.1499 17.6061 22.1499 12.0004C22.1499 6.3947 17.6056 1.85039 11.9999 1.85039C6.39421 1.85039 1.8499 6.3947 1.8499 12.0004C1.8499 17.6061 6.39421 22.1504 11.9999 22.1504ZM13.0008 16.4753C13.0008 15.923 12.5531 15.4753 12.0008 15.4753L11.9998 15.4753C11.4475 15.4753 10.9998 15.923 10.9998 16.4753C10.9998 17.0276 11.4475 17.4753 11.9998 17.4753L12.0008 17.4753C12.5531 17.4753 13.0008 17.0276 13.0008 16.4753ZM11.9998 6.62898C12.414 6.62898 12.7498 6.96476 12.7498 7.37898L12.7498 13.0555C12.7498 13.4697 12.414 13.8055 11.9998 13.8055C11.5856 13.8055 11.2498 13.4697 11.2498 13.0555L11.2498 7.37898C11.2498 6.96476 11.5856 6.62898 11.9998 6.62898Z" fill="#F04438"></path>
                    </svg>
                </div>

                <div>
                    <h4 class="mb-1 text-sm font-semibold text-gray-800 dark:text-white/90">
                        Error Message
                    </h4>

                    <p class="text-sm text-gray-500 dark:text-gray-400">
                        unsufficient quantity, <strong> please remove the one marked with red collor </strong>
                    </p>
                </div>
            </div>
        </div>
    <% } %>

    <div class="rounded-2xl border border-gray-200 bg-white dark:border-gray-800 dark:bg-white/[0.03]">
        <div class="px-5 py-4 sm:px-6 sm:py-5">
            <h3 class="text-base font-medium text-gray-800 dark:text-white/90">
                Task
            </h3>
        </div>

        <div class="space-y-6 border-t border-gray-100 p-5 sm:p-6 dark:border-gray-800">
            <!-- Elements -->
            <form action="${pageContext.request.contextPath}/tasks/create?projectId=<%= projectId %>" method="POST">
                <div class="mb-5">
                    <label class="mb-1.5 block text-sm font-medium text-gray-700 dark:text-gray-400">
                        Name
                    </label>
                    <div class="relative">
                        <input
                                type="text"
                                value="<%= old != null ? old.getName() : "" %>"
                                name="name"
                                placeholder="Enter project name"
                                class="dark:bg-dark-900 shadow-theme-xs focus:border-brand-300 focus:ring-brand-500/10 dark:focus:border-brand-800 h-11 w-full rounded-lg border border-gray-300 bg-transparent px-4 py-2.5 text-sm text-gray-800 placeholder:text-gray-400 focus:ring-3 focus:outline-hidden dark:border-gray-700 dark:bg-gray-900 dark:text-white/90 dark:placeholder:text-white/30"
                        />
                    </div>
                    <% if (errors != null && errors.containsKey("name")) { %>
                    <p class="text-theme-xs text-error-500 mt-1.5">
                        <%= errors.get("name") %>
                    </p>
                    <% } %>
                </div>

                <div class="mb-5">
                    <label class="mb-1.5 block text-sm font-medium text-gray-700 dark:text-gray-400">
                        Description
                    </label>
                    <textarea
                            placeholder="Enter a description..."
                            type="text" rows="6"
                            name="description"
                            class="dark:bg-dark-900 shadow-theme-xs focus:border-brand-300 focus:ring-brand-500/10 dark:focus:border-brand-800 w-full rounded-lg border border-gray-300 bg-transparent px-4 py-2.5 text-sm text-gray-800 placeholder:text-gray-400 focus:ring-3 focus:outline-hidden dark:border-gray-700 dark:bg-gray-900 dark:text-white/90 dark:placeholder:text-white/30"><%= old != null ? old.getDescription() : "" %></textarea>
                    <% if (errors != null && errors.containsKey("description")) { %>
                    <p class="text-theme-xs text-error-500 mt-1.5">
                        <%= errors.get("description") %>
                    </p>
                    <% } %>
                </div>

                <div class="grid grid-cols-1 gap-6 sm:grid-cols-2 mb-5">
                    <div>
                        <label class="mb-1.5 block text-sm font-medium text-gray-700 dark:text-gray-400">
                            Start date
                        </label>

                        <div class="relative">
                            <input
                                    type="date"
                                    value="<%= old != null ? old.getStartDate() : "" %>"
                                    name="startDate"
                                    placeholder="Select start date"
                                    class="dark:bg-dark-900 shadow-theme-xs focus:border-brand-300 focus:ring-brand-500/10 dark:focus:border-brand-800 h-11 w-full appearance-none rounded-lg border border-gray-300 bg-transparent bg-none px-4 py-2.5 pr-11 pl-4 text-sm text-gray-800 placeholder:text-gray-400 focus:ring-3 focus:outline-hidden dark:border-gray-700 dark:bg-gray-900 dark:text-white/90 dark:placeholder:text-white/30"
                            />
                        </div>
                        <% if (errors != null && errors.containsKey("startDate")) { %>
                        <p class="text-theme-xs text-error-500 mt-1.5">
                            <%= errors.get("startDate") %>
                        </p>
                        <% } %>
                    </div>

                    <div>
                        <label class="mb-1.5 block text-sm font-medium text-gray-700 dark:text-gray-400">
                            End date
                        </label>

                        <div class="relative">
                            <input
                                    type="date"
                                    name="endDate"
                                    value="<%= old != null ? old.getEndDate() : "" %>"
                                    placeholder="Select end date"
                                    class="dark:bg-dark-900 shadow-theme-xs focus:border-brand-300 focus:ring-brand-500/10 dark:focus:border-brand-800 h-11 w-full appearance-none rounded-lg border border-gray-300 bg-transparent bg-none px-4 py-2.5 pr-11 pl-4 text-sm text-gray-800 placeholder:text-gray-400 focus:ring-3 focus:outline-hidden dark:border-gray-700 dark:bg-gray-900 dark:text-white/90 dark:placeholder:text-white/30"
                            />
                        </div>
                        <% if (errors != null && errors.containsKey("endDate")) { %>
                            <p class="text-theme-xs text-error-500 mt-1.5">
                                <%= errors.get("endDate") %>
                            </p>
                        <% } %>
                    </div>
                </div>

                <input
                        type="text"
                        name="resources"
                        id="resources"
                        hidden
                    <% if ( oldResources != null ) { %>
                        value='<%= oldResources %>'
                    <% } %>
                />

                <div class="mt-5 grid grid-cols-8 gap-3">
                    <div class="col-span-4">
                        <label class="mb-1.5 block text-sm font-medium text-gray-700 dark:text-gray-400">Choose resource</label>
                        <div x-data="{ isOptionSelected: false }" class="relative z-20 bg-transparent">
                            <select id="resource-select" class="dark:bg-dark-900 shadow-theme-xs focus:border-brand-300 focus:ring-brand-500/10 dark:focus:border-brand-800 h-11 w-full appearance-none rounded-lg border border-gray-300 bg-transparent bg-none px-4 py-2.5 pr-11 text-sm text-gray-800 placeholder:text-gray-400 focus:ring-3 focus:outline-hidden dark:border-gray-700 dark:bg-gray-900 dark:text-white/90 dark:placeholder:text-white/30"
                                    :class="isOptionSelected && 'text-gray-800 dark:text-white/90'"
                                    @change="isOptionSelected = true">

                                <% for (Resource resource : resources) { %>
                                <% // Example object
                                    ObjectMapper objectMapper = new ObjectMapper();
                                    String jsonResource = objectMapper.writeValueAsString(resource);
                                %>

                                <option value='<%= jsonResource %>'
                                        class="text-gray-700 dark:bg-gray-900 dark:text-gray-400">
                                    <%= resource.getName() %>
                                </option>
                                <% } %>

                            </select>
                            <span
                                    class="pointer-events-none absolute top-1/2 right-4 z-30 -translate-y-1/2 text-gray-500 dark:text-gray-400">
                                <svg class="stroke-current" width="20" height="20" viewBox="0 0 20 20" fill="none"
                                     xmlns="http://www.w3.org/2000/svg">
                                  <path d="M4.79175 7.396L10.0001 12.6043L15.2084 7.396" stroke="" stroke-width="1.5"
                                        stroke-linecap="round" stroke-linejoin="round"/>
                                </svg>
                              </span>
                        </div>
                    </div>
                    <div class="col-span-2">
                        <label class="mb-1.5 block text-sm font-medium text-gray-700 dark:text-gray-400"> Quantity </label>
                        <div class="relative">
                            <input
                                    id="resourceQty"
                                    type="number"
                                    value=""
                                    placeholder="Add quantity"
                                    class="dark:bg-dark-900 shadow-theme-xs focus:border-brand-300 focus:ring-brand-500/10 dark:focus:border-brand-800 h-11 w-full appearance-none rounded-lg border border-gray-300 bg-transparent bg-none px-4 py-2.5 pr-11 pl-4 text-sm text-gray-800 placeholder:text-gray-400 focus:ring-3 focus:outline-hidden dark:border-gray-700 dark:bg-gray-900 dark:text-white/90 dark:placeholder:text-white/30"
                            />
                        </div>
                    </div>
                    <div class="col-span-2 flex justify-center items-center">
                        <button type="button" id="addResourceBtn" class="py-2 px-4 bg-blue-400 text-gray-700 dark:text-white">Add resource</button>
                    </div>
                </div>


                <div class="relative flex flex-col rounded-lg bg-slate-900 shadow-sm border border-slate-700 text-white mt-5">
                    <div id="resource-items" class="flex min-w-[240px] flex-col gap-1 p-1.5">
                        <div role="button" class="text-white flex w-full items-center rounded-md p-2 pl-3 transition-all hover:bg-slate-800 focus:bg-slate-800 active:bg-slate-800 grid grid-cols-8 gap-3">
                            <div class="col-span-4">Item One</div>
                            <div class="col-span-2">12</div>
                            <div class="ml-auto col-span-2 grid place-items-center justify-self-end">
                                <button class="rounded-md border border-transparent p-2.5 text-center text-sm transition-all text-slate-400 hover:bg-slate-700 focus:bg-slate-700 active:bg-slate-700 disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none" type="button">
                                    delete
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <div>
                    <button type="submit" class="py-2 px-4 bg-blue-400 text-gray-700 dark:text-white">Create Task
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<jsp:include page="/views/parcials/footer.jsp"/>