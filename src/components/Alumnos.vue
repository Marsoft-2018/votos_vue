<template>
    <div class="container">
        <h3 class="title is-1 mt-4">LISTADO DE ALUMNOS</h3>
        <section class="box mt-6">
            <router-link to="formAlumnos"><b-button class="is-primary" type="button">Nuevo Estudiante</b-button></router-link>         
            <b-table
                :data="datos"
                :loading="loading"
                focusable
                
                :paginated="isPaginated"
                :per-page="perPage"
                :current-page.sync="currentPage"
                :pagination-simple="isPaginationSimple"
                :pagination-position="paginationPosition"
                :default-sort-direction="defaultSortDirection"
                :sort-icon="sortIcon"
                :sort-icon-size="sortIconSize"
                default-sort="user.first_name"
                aria-next-label="Next page"
                aria-previous-label="Previous page"
                aria-page-label="Page"
                aria-current-label="Current page"
                :page-input="hasInput"
                :pagination-order="paginationOrder"
                >
                <b-table-column field="id" label="ID" width="40" numeric v-slot="props">
                    {{ props.row.id }}
                </b-table-column>
                <b-table-column field="nombre1" label="Primer Nombre"    v-slot="props">
                    {{ props.row.nombre1 }}
                </b-table-column>
                <b-table-column field="nombre2" label="Segundo Nombre"  v-slot="props">
                    {{ props.row.nombre2 }}
                </b-table-column>
                <b-table-column field="apellido1" label="Primer apellido"    v-slot="props">
                    {{ props.row.apellido1 }}
                </b-table-column>
                <b-table-column field="apellido2" label="Segundo apellido"  v-slot="props">
                    {{ props.row.apellido2 }}
                </b-table-column>
                <b-table-column field="" label="Acciones"  centered  v-slot="props">
                    <b-button type="is-danger" icon-left="delete" outlined @click="confirmEliminacion(props.row.id)">Eliminar</b-button>
                    <b-button type="is-warning" @click="editarAlumno(props.row.id)">Editar</b-button>
                </b-table-column>
            </b-table>
            <b-modal
                v-model="isComponentModalActive"
                has-modal-card
                trap-focus
                :destroy-on-hide="false"
                aria-role="dialog"
                aria-label="Example Modal"
                close-button-aria-label="Close"
                aria-modal>
                <template >
                    <FormularioEstudiantes></FormularioEstudiantes>
                </template>
            </b-modal>
        </section>
    </div>
</template>
<script>
    import axios from 'axios';
    import FormularioEstudiantes from '@/components/Formulario_Estudiante.vue';
import router from '@/router';
    export default {
        components: {
            FormularioEstudiantes
        },
        data() {
            const datos = []            
            return {
                datos,
                select_toogle:false,
                isBordered: false,
                loading:true,
                isComponentModalActive: false,
                isPaginated: true,
                isPaginationSimple: false,
                paginationPosition: 'bottom',
                defaultSortDirection: 'asc',
                sortIcon: 'arrow-up',
                sortIconSize: 'is-small',
                currentPage: 1,
                perPage: 10,
                hasInput: true,
                paginationOrder: 'is-centered',
            }
        },
        mounted(){
            axios.get("http://localhost:21896/api/Estudiantes").then(response => {
                this.datos = response.data
                this.loading = false;
            });
        },
        methods:{
            confirm() {
                this.$buefy.dialog.confirm({
                    message: 'Continue on this task?',
                    onConfirm: () => this.$buefy.toast.open('User confirmed')
                })
            },
            confirmEliminacion(id) {
                this.$buefy.dialog.confirm({
                    title: 'Eliminando registro',
                    message: 'Está seguro de <b>eliminar</b> este registro? <br>Esta acción no se puede deshacer.',
                    confirmText: 'Eliminar',
                    type: 'is-danger',
                    hasIcon: true,
                    onConfirm: () =>{ 
                        console.log("Id a eliminar: "+id);
                        axios.delete('http://localhost:21896/api/Estudiantes/'+id).then(result =>{                          
                        //this.mensaje = result.data[0].nombre;
                        this.$buefy.toast.open(result.data);
                        this.datos.splice(id,1);
                        });
                    }
                })
            },
            editarAlumno(id){
                router.push("/formAlumnos/"+id);
            }
        },
        created(){
            axios.get("http://localhost:21896/api/Estudiantes").then(response => {
                this.datos = response.data
                this.loading = false;
            });
        }
    }
</script>
<style scoped>

</style>