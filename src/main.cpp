/*****************************************************************************
 *   Copyright (C) 2017 by Yunusemre Senturk                                 *
 *   <yunusemre.senturk@pardus.org.tr>                                       *
 *                                                                           *
 *   This program is free software; you can redistribute it and/or modify    *
 *   it under the terms of the GNU General Public License as published by    *
 *   the Free Software Foundation; either version 2 of the License, or       *
 *   (at your option) any later version.                                     *
 *                                                                           *
 *   This program is distributed in the hope that it will be useful,         *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of          *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           *
 *   GNU General Public License for more details.                            *
 *                                                                           *
 *   You should have received a copy of the GNU General Public License       *
 *   along with this program; if not, write to the                           *
 *   Free Software Foundation, Inc.,                                         *
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA .          *
 *****************************************************************************/
#include "helper.h"
#include "signalhandler.h"
#include <signal.h>
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>

static int setup_unix_signal_handlers();

int main(int argc, char *argv[])
{
    qmlRegisterType<Helper>("eta.helper",1,0,"Helper");
    QApplication app(argc, argv);

    setup_unix_signal_handlers();

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/ui/main.qml")));

    return app.exec();
}

static int setup_unix_signal_handlers()
{
    struct sigaction sig;
    sig.sa_handler = SignalHandler::handleSignals;
    sigemptyset(&sig.sa_mask);
    sig.sa_flags = 0;
    sig.sa_flags |= SA_RESTART;

    if (sigaction(SIGINT, &sig, 0)) {
        return 1;
    }

    if (sigaction(SIGTERM, &sig, 0)) {
        return 2;
    }

    if (sigaction(SIGHUP, &sig, 0)) {
        return 3;
    }

    return 0;
}
