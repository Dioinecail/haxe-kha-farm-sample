let project = new Project('New Project');
project.addAssets('Assets/**');
project.addSources('Sources/**');
project.addSources('Sources/game');
project.addSources('Sources/game/resources');
project.addSources('Sources/game/debug');
project.addLibrary('zui');
resolve(project);
