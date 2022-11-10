import Vue from 'vue'
import VueRouter from 'vue-router'
import PanelAdmin from '../views/PanelAdmin.vue'
import Login from '../components/Login.vue'
import Alumnos from '../components/Alumnos'
import Formulario_Estudiante from '../components/Formulario_Estudiante'
Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'login',
    component: Login
  },
  {
    path: '/about',
    name: 'about',
    component: () => import('../views/AboutView.vue')
  },
  {
    path: '/panelAdmin',
    name: 'panelAdmin',
    component: () => import('../views/PanelAdmin.vue'),
    children:[
      {
        path: '/alumnos',
        name: 'alumnos',
        component: Alumnos
      },
      {
        path:'/formAlumnos/:id',
        name:'formAlumnos',
        component: Formulario_Estudiante
      },
      {
        path:'/formAlumnos/',
        name:'formAlumnos',
        component: Formulario_Estudiante
      },
      {
        path: '/candidatos',
        name: 'candidatos',
        component: () => import('../views/Candidatos.vue')
      }  ,
      {
        path: '/conteo',
        name: 'conteo',
        component: () => import('../views/Votos/Conteo.vue')
      } ,
      {
        path: '/tarjetonAdmin',
        name: 'tarjetonAdmin',
        component: () => import('../views/Votos/Tarjeton.vue'),
        
      }     
    ]
  },
  {
    path: '/tarjeton/:id',
    name: 'tarjeton',
    component: () => import('../views/Votos/Tarjeton.vue'),
    
  }

]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
