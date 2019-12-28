import DashboardPage from "./pages/private/DashboardPage";

const routes = [
  {
    collapse: true,
    name: "Dashboards",
    icon: "ni ni-shop text-primary",
    state: "dashboardsCollapse",
    views: [
      {
        path: "/u/dashboard",
        name: "Dashboard",
        component: DashboardPage,
        layout: "/Admin"
      }
    ]
  }
];

export default routes;
