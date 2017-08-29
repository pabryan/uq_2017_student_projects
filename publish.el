(setq pb/current-project "uq_2017_student_projects")
(setq pb/org-src-path  (concat "~/working/academic/teaching/uq/2017/student_projects/" pb/current-project))
(setq pb/org-publish-path (concat "~/publish/academic/teaching/uq/2017/student_projects/" pb/current-project))

(setq org-publish-project-alist (pb/create-org-publish-alist pb/current-project pb/org-src-path pb/org-publish-path))
