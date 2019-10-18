git init                            # inicia repositorio git
git add [ficheros]                  # envía los cambios de los ficheros a staging
git commit -m [mensaje de commit]   # guarda en la rama master del repositorio los cambios que había en staging
git checkout                        # descarga cambios que no teníamos según cómo lo modifiques

git merge                           # unión de dos ramas

git status                          # muestra el estado del repositorio, si existe
git rm [ficheros]                   # borra los ficheros del repositorio (no del sistema de ficheros)
git rm --cached [ficheros]          # borra los ficheros de staging (es lo contrario de git add)

git config --list                   # muestra la configuración de git por defecto
git config --list --show-origin     # muestra dónde están guardadas las configuraciones

git config --global user.name "Ultano"             # configura a nivel global el username como Ultano
git config --global user.email "ultano@gmail.com"  # configura a nivel global el email como ultano@gmail.com

git log [fichero]                   # muestra la historia de un fichero: commits con sus fechas y mensajes de commit
git show [fichero]                  # muestra los cambios de un fichero de texto plano entre la versión actual y la anterior

git diff                                           # muestra las diferencias entre el estado actual y el último commit
git diff identificadorcommit1 identificadorcommit3 # muestra las diferencias entre el commit 1 y el commit 3

git reset identificadorcommit3 --hard   # devuelve el repositorio al estado en que estaba en el commit 3
git reset identificadorcommit3 --soft   # devuelve el repositorio al commit 3, pero sin borrar lo que tenemos en staging

git log --stat                      # cambios en cada fichero desde el commit anterior al commit actual
git checkout identificadorcommit3 [fichero]     # pone el fichero tal como estaba en el commit 3 (en staging)
git checkout master [fichero]     # pone el fichero tal como estaba guardado en la rama master

git fetch                           # descarga los commits del repositorio remoto, pero no lo pasa a staging
git merge                           # aplica los cambios de un commit al staging en un nuevo commit
git pull                            # hace un git fetch y un git merge

git commit -am [mensaje de commit]  # hace un git add de aquellos ficheros que previamente estaban en el repositorio y un commit -m

git branch [nombre de rama]         # crea una nueva rama a partir del estado actual del repositorio
git checkout [nombre de rama]       # cambia el repositorio al head (último commit) de otra rama

# cuando se hace un merge, la rama secundaria se une a la primaria (muchas veces es master)

git branch          # lista las ramas

# estando en la rama master:
git merge [nombre de la rama]      # hace un nuevo commit en master con los cambios combinados del head de master y el head de la otra rama
  # en caso de conflicto, hay que solucionar los conflictos y luego hacer un commit con los ficheros que hay en el repositorio
git commit -am "solucionados los conflictos"


git remote add origin https://mirepositoriode.git/repo  #añade un repositorio remoto
git remote -v # muestra repositorios a los que hacer fetch y de los que hacer push

ssh-keygen -t rsa -b 4096 -C "ultano@gmail.com"  # generar clave rsa
eval $(ssh-agent -s) # comprobamos que se está ejecutando el servidor de ssh

ssh-add ~/.ssh/id_rsa  # añade la llave ssh privada

git remote add origin git@github.com:Ultano/python.git # añade la url del repositorio remoto
git remote set-url origin git@github.com:Ultano/tienda  # modifica la url del repositorio remoto
git remote set-url origin git@github.com:Ultano/docker.git  # modifica la url del repositorio remoto
git pull origin # pull desde el origin

git log --all --graph       # muestra la evolución del proyecto y las diferentes ramas
git log --all --graph --decorate --oneline       # muestra la evolución del proyecto y las diferentes ramas
alias arbolito="git log --all --graph --decorate --oneline"       # nos hacemos un alias para usarlo de vez en cuando

git tag -a v.0.1 -m "primera versión de mi proyecto" [hash del commit] # creamos una etiqueta con el proyecto en el estado en que se encontraba
                                                                       # justo después del commit cuyo hash hemos puesto como último parámetro
git tag # muestra los tags del proyecto
git show-ref --tags # muestra los tags del proyecto y los hases de los commits correspondientes

git push origin --tags # subes al repositorio las tags del proyecto
git tag -d [nombre del tag] # elimina una etiqueta

git push origin :refs/tags/[nombre del tag] # borra la etiqueta incluso de github

git show-branch # muestra las ramas y su historia
git show-branch --all # muestra las ramas y su historia con más detalle

gitk # abre un entorno gráfico de git (si es que tienes entorno gráfico)

git push origin [branch] # sube una rama en concreto al repositorio remoto
git pull origin [branch] # baja una rama en concreto al repositorio remoto

git clone https://github.com/Ultano/tienda # se descarga un repositorio completo

# pull request => github
# merge request => gitlab
# push request => bitbucket

# para usar pull request:
    # 1.- descargamos la rama master del repositorio remoto:
git pull origin master
    # 2.- creamos la nueva rama para la tarea a realizar
git branch nuevaTarea
    # 3.- cambiamos a dicha rama
git checkout nuevaTarea
    # 4.- subimos la nueva rama al repositorio remoto
git push
    # 5.- realizamos la tarea y hacemos un commit
git add [ficheros modificados]
git commit -m "tarea realizada"
git pull
git push origin nuevaTarea
    # al crear el pull request entre una rama y el master no se fusionan las ramas
    # para fusionarlas, tenemos que hacer un merge, para lo cual, los cambios deben estar aprobados
        # las opciones rebase y squash son malas prácticas, por lo general

# cuando hacemos un fork o, por el motivo que sea, queremos descargarnos los comabios
# desde un sitio diferente a aquel en el que guardamos nuestros commits, hacemos:
git remote add upstream https://github.com/ultano/proyecto_original # lo podemos llamar upstream o como queramos
# de forma que cuando queramos que nuestro fork converja con el proyecto original podemos hacer:

git pull upstream master # descargamos los cambios de la rama master de proyecto original a nuestra rama master

git rebase master # MALA PRÁCTICA: trae todos los commits de la rama master a la rama actual
git rebase otra_rama # sobre escribe la historia de master con los commits de otra_rama

git stash # guarda en un lugar temporal los cambios actuales
git stash list # muestra los cambios temporalmente guardados
git stash pop # deja la rama con los cambios temporales activados, pudiendo dar ctr + z para deshacerlos
git stash branch mi_nueva_rama # crea una nueva rama a partir de los cambios temporales y cambia a esa rama
git stash drop # descarta los cambios temporales guardados

git clean --dry-run # hace una simulación de borrado de ficheros que no se han guardado
git clean -f #fuerza el borrado

git cherry-pick [hash del commit] # se trae un commit de otra rama a la rama actual. Mala práctica, porque cambia la historia del proyecto






# end of file
